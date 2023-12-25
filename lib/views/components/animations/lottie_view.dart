import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:instagram_clone/views/components/animations/models/lottie.dart';
import 'package:lottie/lottie.dart';

part 'lottie_view.g.dart';

extension GetFullPath on LottieAnimation {
  String get fullPath => 'assets/animations/$name.json';
}

@swidget
Widget lottieAnimationView({
  required LottieAnimation animation,
  bool repeat = true,
  bool reverse = false,
}) {
  return Lottie.asset(animation.fullPath, reverse: reverse, repeat: repeat);
}
