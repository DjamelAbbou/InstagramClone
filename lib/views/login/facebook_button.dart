import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:instagram_clone/views/components/constants/app_colors.dart';
import 'package:instagram_clone/views/components/constants/strings.dart';

part 'facebook_button.g.dart';

@swidget
Widget facebookButton() {
  return SizedBox(
    height: 44.0, // TODO: use fontawesome google icon
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          FontAwesomeIcons.facebook,
          color: AppColors.facebookColor,
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          Strings.facebook,
        )
      ],
    ),
  );
}
