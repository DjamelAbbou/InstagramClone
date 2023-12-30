import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:instagram_clone/state/posts/models/post.dart';
import 'package:instagram_clone/views/components/post/thumbnail.dart';
import 'package:instagram_clone/views/post_comments/index.dart';

part 'grid.g.dart';

@swidget
Widget postsGridView(BuildContext context,
    {required final Iterable<Post> posts}) {
  return GridView.builder(
    padding: const EdgeInsets.all(8),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    ),
    itemCount: posts.length,
    itemBuilder: (context, index) {
      final post = posts.elementAt(index);
      return PostThumbnailView(
        post: post,
        onTapped: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return PostCommentsView(postId: post.postId);
            },
          ));
        },
      );
    },
  );
}
