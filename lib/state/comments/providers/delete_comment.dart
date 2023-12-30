import 'package:instagram_clone/state/image_upload/typedefs/is_loading.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_comment.g.dart';

@riverpod
class AuthStateNotifier extends _$AuthStateNotifier {
  IsLoading build() => false;

  set isLoading(bool value) => state = value;
}
