import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart' show Colors, TextStyle, TextDecoration;

@immutable
class BaseText {
  final String text;
  final TextStyle? style;

  BaseText({required this.text, this.style});
}
