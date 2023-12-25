import 'package:flutter/material.dart';
import 'package:instagram_clone/extensions/string/remove_all.dart';

extension AsHexToColor on String {
  Color HexToColor() => Color(
        int.parse(
          removeAll(['0x', '#']).padLeft(8, 'ff'),
          radix: 16,
        ),
      );
}
