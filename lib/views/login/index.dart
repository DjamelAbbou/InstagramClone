import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/auth/notifiers/auth_state_notifier.dart';
import 'package:instagram_clone/views/components/constants/app_colors.dart';
import 'package:instagram_clone/views/components/constants/strings.dart';
import 'package:instagram_clone/views/login/divider_with_margins.dart';
import 'package:instagram_clone/views/login/facebook_button.dart';
import 'package:instagram_clone/views/login/google_button.dart';
import 'package:instagram_clone/views/login/signup_links.dart';

part 'index.g.dart';

@cwidget
Widget loginView(BuildContext context, WidgetRef ref) {
  return Scaffold(
    appBar: AppBar(
      title: const Text(
        Strings.appName,
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 40,
            ),
            // header text
            Text(
              Strings.welcomeToAppName,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const DividerWithMargins(),
            Text(
              Strings.logIntoYourAccount,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(height: 1.5),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.loginButtonColor,
                foregroundColor: AppColors.loginButtonTextColor,
              ),
              onPressed: ref
                  .read(authStateNotifierProvider.notifier)
                  .loginWithFacebook,
              child: const FacebookButton(),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.loginButtonColor,
                foregroundColor: AppColors.loginButtonTextColor,
              ),
              onPressed:
                  ref.read(authStateNotifierProvider.notifier).loginWithGoogle,
              child: const GoogleButton(),
            ),
            const DividerWithMargins(),
            const SignUpLinks(),
          ],
        ),
      ),
    ),
  );
}
