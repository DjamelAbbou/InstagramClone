import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:instagram_clone/views/components/constants/app_colors.dart';
import 'package:instagram_clone/views/components/constants/strings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

part 'google_button.g.dart';

@swidget
Widget googleButton() {
  return SizedBox(
    height: 44.0, // TODO: use fontawesome google icon
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          FontAwesomeIcons.google,
          color: AppColors.googleColor,
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          Strings.google,
        )
      ],
    ),
  );
}
