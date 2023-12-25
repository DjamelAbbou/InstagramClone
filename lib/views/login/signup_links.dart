import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:instagram_clone/views/components/constants/strings.dart';
import 'package:instagram_clone/views/components/rich_text/base.dart';
import 'package:instagram_clone/views/components/rich_text/index.dart';
import 'package:url_launcher/url_launcher.dart';

part 'signup_links.g.dart';

@swidget
Widget signUpLinks(BuildContext context) {
  return RichTextWidget(
    texts: [
      BaseText.plain(text: Strings.dontHaveAnAccount),
      BaseText.plain(text: Strings.signUpOn),
      BaseText.link(
        text: Strings.facebook,
        onTapped: () {
          launchUrl(
            Uri.parse(Strings.facebookSignupUrl),
          );
        },
      ),
      BaseText.plain(text: Strings.orCreateAnAccountOn),
      BaseText.link(
        text: Strings.google,
        onTapped: () {
          launchUrl(
            Uri.parse(Strings.googleSignupUrl),
          );
        },
      )
    ],
    styleForAll: Theme.of(context).textTheme.titleMedium?.copyWith(height: 1.5),
  );
}
