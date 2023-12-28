import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:instagram_clone/state/posts/models/post.dart';

part 'thumbnail.g.dart';

@swidget
Widget postThumbnailView(
    {required final Post post, required final VoidCallback onTapped}) {
  return GestureDetector(
    onTap: onTapped,
    child: Image.network(
      post.thumbnailUrl,
      fit: BoxFit.cover,
    ),
  );
}
