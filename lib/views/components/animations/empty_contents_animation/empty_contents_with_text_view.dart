import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:instagram_clone/views/components/animations/empty_contents_animation/empty_contents_view.dart';

part 'empty_contents_with_text_view.g.dart';

@swidget
Widget emptyContentsWithTextAnimationView(
  BuildContext context, {
  required String text,
}) {
  return Center(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white54),
          ),
        ),
        const EmptyContentsAnimationView()
      ],
    ),
  );
}
