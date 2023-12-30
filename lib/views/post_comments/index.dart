import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/auth/providers/user_id.dart';
import 'package:instagram_clone/state/comments/models/post_comments_request.dart';
import 'package:instagram_clone/state/comments/notifiers/send_comment.dart';
import 'package:instagram_clone/state/comments/providers/post_comment.dart';
import 'package:instagram_clone/state/posts/typedefs/post_id.dart';
import 'package:instagram_clone/views/components/animations/empty_contents_animation/empty_contents_with_text_view.dart';
import 'package:instagram_clone/views/components/animations/error_view.dart';
import 'package:instagram_clone/views/components/comment/tile.dart';
import 'package:instagram_clone/views/components/constants/strings.dart';

part 'index.g.dart';

@hcwidget
Widget postCommentsView(WidgetRef ref, BuildContext context,
    {required PostId postId}) {
  final commentController = useTextEditingController();
  final hasText = useState(false);
  final request = useState(
    RequestForPostAndComments(
      postId: postId,
    ),
  );

  final userId = ref.read(userIdProvider);

  final comments = ref.watch(postCommentProvider(
    request.value,
  ));

  useEffect(() {
    commentController.addListener(
      () {
        hasText.value = commentController.text.isNotEmpty;
      },
    );
    return () {};
  }, [commentController]);
  return Scaffold(
    appBar: AppBar(
      title: const Text(Strings.comments),
      actions: [
        IconButton(
          onPressed: () async {
            if (hasText.value && userId != null) {
              submitComment(ref, commentController, postId, userId);
            }
          },
          icon: hasText.value
              ? Icon(Icons.send, color: Colors.blue[300])
              : const Icon(Icons.send),
        )
      ],
    ),
    body: SafeArea(
      child: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 4,
            child: comments.when(
              data: (comments) {
                if (comments.isEmpty) {
                  return const SingleChildScrollView(
                    child: EmptyContentsWithTextAnimationView(
                        text: Strings.noCommentsYet),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () {
                    ref.refresh(
                      postCommentProvider(
                        request.value,
                      ),
                    );
                    return Future.delayed(
                      const Duration(seconds: 1),
                    );
                  },
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final comment = comments.elementAt(index);
                      return CommentTile(comment: comment);
                    },
                    itemCount: comments.length,
                    padding: const EdgeInsets.all(8.0),
                  ),
                );
              },
              error: (error, stackTrace) {
                return const ErrorAnimationView();
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  textInputAction: TextInputAction.send,
                  controller: commentController,
                  onSubmitted: (comment) {
                    if (comment.isNotEmpty && userId != null) {
                      submitComment(ref, commentController, postId, userId);
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: Strings.writeYourCommentHere,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

void submitComment(WidgetRef ref, TextEditingController commentController,
    PostId postId, String userId) async {
  final isSent =
      await ref.read(sendCommentNotifierProvider.notifier).sendComment(
            userId: userId,
            comment: commentController.text,
            onPostId: postId,
          );

  if (isSent) {
    commentController.clear();
    // dismissKeyboard();
    //! since i am using functional riverpod i dont have access to the dismissKeyboard added by the extension...
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
