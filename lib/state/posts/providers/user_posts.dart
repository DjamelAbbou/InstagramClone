import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/state/auth/providers/user_id.dart';
import 'package:instagram_clone/state/constants/firebase_collection_name.dart';
import 'package:instagram_clone/state/constants/firebase_field_name.dart';
import 'package:instagram_clone/state/posts/models/post.dart';
import 'package:instagram_clone/state/posts/models/post_key.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_posts.g.dart';

@riverpod
Stream<Iterable<Post>> userPosts(ref) {
  final controller = StreamController<Iterable<Post>>();

  final userId = ref.watch(userIdProvider);

  controller.onListen = () {
    controller.sink.add([]);
  };

  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionName.posts)
      .orderBy(
        FirebaseFieldName.createdAt,
        descending: true,
      )
      .where(
        PostKey.userId,
        isEqualTo: userId,
      )
      .snapshots()
      .listen((snapshot) {
    final documents = snapshot.docs;
    final posts = documents
        .where(
          (doc) => !doc.metadata.hasPendingWrites,
        )
        .map(
          (doc) => Post(
            postId: doc.id,
            json: doc.data(),
          ),
        );

    controller.sink.add(posts);
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
}
