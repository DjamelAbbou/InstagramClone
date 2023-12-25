import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'divider_with_margins.g.dart';

@swidget
Widget dividerWithMargins() {
  return const Column(
    children: [
      SizedBox(
        height: 40.0,
      ),
      Divider(),
      SizedBox(
        height: 40.0,
      )
    ],
  );
}
