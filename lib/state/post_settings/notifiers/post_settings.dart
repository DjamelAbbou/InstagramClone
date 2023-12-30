import 'dart:collection';

import 'package:instagram_clone/state/post_settings/models/post_settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_settings.g.dart';

@riverpod
class PostSettingNotifier extends _$PostSettingNotifier {
  @override
  Map<PostSetting, bool> build() => UnmodifiableMapView(
        {
          for (final setting in PostSetting.values) setting: true,
        },
      );

  void setSetting(PostSetting setting, bool value) {
    final existingValue = state[setting];
    if (existingValue == null || existingValue == value) {
      return;
    }
    state = Map.unmodifiable(
      Map.from(state)..[setting] = value,
    );
  }
}
