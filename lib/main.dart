import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

// * Firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'package:instagram_clone/state/auth/notifiers/auth_state_notifier.dart';
import 'package:instagram_clone/state/auth/providers/is_logged_in.dart'
    show isLoggedInProvider;
import 'package:instagram_clone/state/providers/is_loading.dart';
import 'package:instagram_clone/views/components/loading/loading_screen.dart';
import 'package:instagram_clone/views/login/index.dart';
import 'firebase_options.dart';

// * For Log Function

part 'main.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

@swidget
Widget myApp(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    darkTheme: ThemeData.dark(),
    themeMode: ThemeMode.dark,
    home: withSafeArea(
      Consumer(
        builder: (context, ref, child) {
          ref.listen<bool>(
            isLoadingProvider,
            (_, isLoading) {
              if (isLoading) {
                LoadingScreen.instance().show(context: context);
              } else {
                LoadingScreen.instance().hide();
              }
            },
          );

          final isLoggedIn = ref.watch(isLoggedInProvider);

          return isLoggedIn ? const MainView() : const LoginView();
        },
      ),
    ),
  );
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
        // LoadingScreen.instance().show(context: context, text: "hi");
        await ref.read(authStateNotifierProvider.notifier).logOut();
      },
    ),
  );
}
