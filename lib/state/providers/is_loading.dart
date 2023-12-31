import 'package:instagram_clone/state/auth/notifiers/auth_state_notifier.dart';
import 'package:instagram_clone/state/image_upload/notifiers/image_upload.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_loading.g.dart';

@riverpod
bool isLoading(ref) {
  final authState = ref.watch(authStateNotifierProvider);
  final isUploadingImage = ref.watch(imageUploadNotifierProvider);
  return authState.isLoading || isUploadingImage;
}
