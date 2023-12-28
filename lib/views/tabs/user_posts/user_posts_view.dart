import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/posts/providers/user_posts.dart';
import 'package:instagram_clone/views/components/animations/empty_contents_animation/empty_contents_with_text_view.dart';
import 'package:instagram_clone/views/components/animations/error_view.dart';
import 'package:instagram_clone/views/components/animations/loading_view.dart';
import 'package:instagram_clone/views/components/constants/strings.dart';
import 'package:instagram_clone/views/components/post/grid.dart';

part 'user_posts_view.g.dart';

@cwidget
Widget userPostsView(BuildContext context, WidgetRef ref) {
  final posts = ref.watch(userPostsProvider);
  return RefreshIndicator(
    onRefresh: () {
      ref.refresh(userPostsProvider);
      return Future.delayed(
        const Duration(seconds: 1),
      );
    },
    child: posts.when(
      data: (posts) {
        if (posts.isEmpty) {
          return const EmptyContentsWithTextAnimationView(
              text: Strings.youHaveNoPosts);
        } else {
          return PostsGridView(
            posts: posts,
          );
        }
      },
      error: (error, stackTrack) {
        return const ErrorAnimationView();
      },
      loading: () {
        return const LoadingAnimationView();
      },
    ),
  );
}
