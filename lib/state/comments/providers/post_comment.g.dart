// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postCommentHash() => r'27ebbc94c92da698e94a7297e050ada31695bb3c';

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

/// See also [postComment].
@ProviderFor(postComment)
const postCommentProvider = PostCommentFamily();

/// See also [postComment].
class PostCommentFamily extends Family<AsyncValue<Iterable<Comment>>> {
  /// See also [postComment].
  const PostCommentFamily();

  /// See also [postComment].
  PostCommentProvider call(
    RequestForPostAndComments request,
  ) {
    return PostCommentProvider(
      request,
    );
  }

  @override
  PostCommentProvider getProviderOverride(
    covariant PostCommentProvider provider,
  ) {
    return call(
      provider.request,
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
  String? get name => r'postCommentProvider';
}

/// See also [postComment].
class PostCommentProvider extends AutoDisposeStreamProvider<Iterable<Comment>> {
  /// See also [postComment].
  PostCommentProvider(
    RequestForPostAndComments request,
  ) : this._internal(
          (ref) => postComment(
            ref as PostCommentRef,
            request,
          ),
          from: postCommentProvider,
          name: r'postCommentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postCommentHash,
          dependencies: PostCommentFamily._dependencies,
          allTransitiveDependencies:
              PostCommentFamily._allTransitiveDependencies,
          request: request,
        );

  PostCommentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.request,
  }) : super.internal();

  final RequestForPostAndComments request;

  @override
  Override overrideWith(
    Stream<Iterable<Comment>> Function(PostCommentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostCommentProvider._internal(
        (ref) => create(ref as PostCommentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        request: request,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Iterable<Comment>> createElement() {
    return _PostCommentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostCommentProvider && other.request == request;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, request.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostCommentRef on AutoDisposeStreamProviderRef<Iterable<Comment>> {
  /// The parameter `request` of this provider.
  RequestForPostAndComments get request;
}

class _PostCommentProviderElement
    extends AutoDisposeStreamProviderElement<Iterable<Comment>>
    with PostCommentRef {
  _PostCommentProviderElement(super.provider);

  @override
  RequestForPostAndComments get request =>
      (origin as PostCommentProvider).request;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
