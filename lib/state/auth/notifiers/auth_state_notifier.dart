import 'package:instagram_clone/state/auth/backend/authenticator.dart';
import 'package:instagram_clone/state/auth/models/auth_result.dart';
import 'package:instagram_clone/state/auth/models/auth_state.dart';
import 'package:instagram_clone/state/posts/typedefs/user_id.dart';
import 'package:instagram_clone/state/user_info/backend/user_info_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_notifier.g.dart';

@riverpod
class AuthStateNotifier extends _$AuthStateNotifier {
  final _authenticator = const Authenticator();
  final _userInfoStorage = const UserInfoStorage();

  @override
  AuthState build() {
    if (_authenticator.isAlreadyLoggedIn) {
      return AuthState(
          result: AuthResult.success,
          isLoading: false,
          userId: _authenticator.userId);
    }
    return AuthState.unknown();
  }

  Future<void> logOut() async {
    state = state.copiedWithIsLoading(true);
    await _authenticator.logOut();
    state = const AuthState.unknown();
  }

  Future<void> loginWithGoogle() async {
    state = state.copiedWithIsLoading(true);
    final result = await _authenticator.loginWithGoogle();
    final userId = _authenticator.userId;
    if (result == AuthResult.success && userId != null) {
      saveUserInfo(userId: userId);
    }

    state = AuthState(result: result, isLoading: false, userId: userId);
  }

  Future<void> loginWithFacebook() async {
    state = state.copiedWithIsLoading(true);
    final result = await _authenticator.loginWithFacebook();
    final userId = _authenticator.userId;
    if (result == AuthResult.success && userId != null) {
      saveUserInfo(userId: userId);
    }

    state = AuthState(result: result, isLoading: false, userId: userId);
  }

  Future<void> saveUserInfo({required UserId userId}) async {
    await _userInfoStorage.saveUserInfo(
        userId: userId,
        displayName: _authenticator.displayName,
        email: _authenticator.email);
  }
}
