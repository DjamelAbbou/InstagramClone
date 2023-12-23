import 'package:instagram_clone/state/auth/models/auth_result.dart';
import 'package:instagram_clone/state/auth/notifiers/auth_state_notifier.dart'
    show authStateNotifierProvider;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_logged_in.g.dart';

@riverpod
bool isLoggedIn(ref) {
  final authState = ref.watch(authStateNotifierProvider);
  return authState.result == AuthResult.success;
}
