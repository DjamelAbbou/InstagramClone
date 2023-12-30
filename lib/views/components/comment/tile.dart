import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/auth/providers/user_id.dart';
import 'package:instagram_clone/state/comments/models/comments.dart';
import 'package:instagram_clone/state/comments/notifiers/delete_comment.dart';
import 'package:instagram_clone/state/user_info/models/providers/user_info.dart';
import 'package:instagram_clone/views/components/animations/small_error_view.dart';
import 'package:instagram_clone/views/components/constants/strings.dart';
import 'package:instagram_clone/views/components/dialogs/alert.dart';
import 'package:instagram_clone/views/components/dialogs/delete.dart';

part 'tile.g.dart';

Future<bool> displayDeleteDialog(BuildContext context) =>
    const DeleteDialog(titleOfObjectToDelete: Strings.comments)
        .present(context)
        .then((value) => value ?? false);

@cwidget
Widget commentTile(WidgetRef ref, BuildContext context,
    {required Comment comment}) {
  final userInfo = ref.watch(
    userInfoModelProvider(userId: comment.fromUserId),
  );

  return userInfo.when(
    data: (userInfo) {
      final currentUserId = ref.read(userIdProvider);
      return ListTile(
        trailing: currentUserId == comment.fromUserId
            ? IconButton(
                onPressed: () async {
                  final shouldDeleteComment =
                      await displayDeleteDialog(context);
                  if (shouldDeleteComment) {
                    await ref
                        .read(deleteCommentStateNotifierProvider.notifier)
                        .deleteComment(commentId: comment.id);
                    //! u stopped at comment payload, which will be used for the comment view section
                  }
                },
                icon: const Icon(Icons.delete),
              )
            : null,
        title: Text(userInfo.displayName),
        subtitle: Text(comment.comment),
      );
    },
    error: ((
      error,
      stackTrace,
    ) =>
        const SmallErrorAnimationView()),
    loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}
