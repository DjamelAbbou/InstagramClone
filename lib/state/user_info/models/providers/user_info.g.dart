// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userInfoModelHash() => r'dda751cf44c83c235c94a2d691843825c45bc35c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [userInfoModel].
@ProviderFor(userInfoModel)
const userInfoModelProvider = UserInfoModelFamily();

/// See also [userInfoModel].
class UserInfoModelFamily extends Family<AsyncValue<UserInfoModel>> {
  /// See also [userInfoModel].
  const UserInfoModelFamily();

  /// See also [userInfoModel].
  UserInfoModelProvider call({
    required String userId,
  }) {
    return UserInfoModelProvider(
      userId: userId,
    );
  }

  @override
  UserInfoModelProvider getProviderOverride(
    covariant UserInfoModelProvider provider,
  ) {
    return call(
      userId: provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userInfoModelProvider';
}

/// See also [userInfoModel].
class UserInfoModelProvider extends AutoDisposeStreamProvider<UserInfoModel> {
  /// See also [userInfoModel].
  UserInfoModelProvider({
    required String userId,
  }) : this._internal(
          (ref) => userInfoModel(
            ref as UserInfoModelRef,
            userId: userId,
          ),
          from: userInfoModelProvider,
          name: r'userInfoModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userInfoModelHash,
          dependencies: UserInfoModelFamily._dependencies,
          allTransitiveDependencies:
              UserInfoModelFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserInfoModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    Stream<UserInfoModel> Function(UserInfoModelRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserInfoModelProvider._internal(
        (ref) => create(ref as UserInfoModelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<UserInfoModel> createElement() {
    return _UserInfoModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserInfoModelProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserInfoModelRef on AutoDisposeStreamProviderRef<UserInfoModel> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserInfoModelProviderElement
    extends AutoDisposeStreamProviderElement<UserInfoModel>
    with UserInfoModelRef {
  _UserInfoModelProviderElement(super.provider);

  @override
  String get userId => (origin as UserInfoModelProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
