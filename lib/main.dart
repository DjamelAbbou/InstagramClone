import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

// * Firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'package:instagram_clone/state/auth/notifiers/auth_state_notifier.dart';
import 'package:instagram_clone/state/auth/providers/is_logged_in.dart'
    show isLoggedInProvider;
import 'firebase_options.dart';

// * For Log Function
import 'dart:developer' as devtools show log;

part 'main.g.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

@cwidget
Widget myApp(WidgetRef ref) {
  final isLoggedIn = ref.watch(isLoggedInProvider);
  return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: withSafeArea(isLoggedIn ? const MainView() : const LoginView()));
}

Widget withSafeArea(Widget child) {
  return SafeArea(child: child);
}

@hcwidget
Widget mainView(BuildContext context, WidgetRef ref) {
  return Scaffold(
    appBar: AppBar(title: Text("MainView")),
    body: TextButton(
      child: Center(child: Text("LogOut")),
      onPressed: () async {
        await ref.read(authStateNotifierProvider.notifier).logOut();
      },
    ),
  );
}

@cwidget
Widget loginView(WidgetRef ref) {
  return Scaffold(
    appBar: AppBar(title: Text("LoginView")),
    body: Column(
      children: [
        TextButton(
            onPressed: () async {
              await ref
                  .read(authStateNotifierProvider.notifier)
                  .loginWithFacebook();
            },
            child: const Text("Facebook")),
        TextButton(
            onPressed: () async {
              await ref
                  .read(authStateNotifierProvider.notifier)
                  .loginWithGoogle();
            },
            child: const Text("Google"))
      ],
    ),
  );
}
