import 'package:instagram_clone/state/auth/notifiers/auth_state_notifier.dart'
    show authStateNotifierProvider;
import 'package:instagram_clone/state/posts/typedefs/user_id.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_id.g.dart';

@riverpod
UserId? userId(ref) => ref.watch(authStateNotifierProvider).userId;
