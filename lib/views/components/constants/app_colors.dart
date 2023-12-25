import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart' show Colors;
import 'package:instagram_clone/extensions/string/hex_to_color.dart';

@immutable
class AppColors {
  static final loginButtonColor = '#cfc9c2'.HexToColor();
  static const loginButtonTextColor = Colors.black;
  static final googleColor = '#4285F4'.HexToColor();
  static final facebookColor = '#3b5998'.HexToColor();
  const AppColors._();
}
