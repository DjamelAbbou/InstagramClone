import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:instagram_clone/views/components/rich_text/base.dart';
import 'package:instagram_clone/views/components/rich_text/link.dart';

part 'index.g.dart';

@swidget
Widget richTextWidget(
    {required Iterable<BaseText> texts, TextStyle? styleForAll}) {
  return RichText(
    text: TextSpan(
        children: texts.map((Text) {
      if (Text is LinkText) {
        return TextSpan(
            text: Text.text,
            style: styleForAll?.merge(Text.style),
            recognizer: TapGestureRecognizer()..onTap = Text.onTapped);
      } else {
        return TextSpan(text: Text.text, style: styleForAll?.merge(Text.style));
      }
    }).toList()),
  );
}
