import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/state/comments/extensions/comment_sorting_by_request.dart';
import 'package:instagram_clone/state/comments/models/comments.dart';
import 'package:instagram_clone/state/comments/models/post_comments_request.dart';
import 'package:instagram_clone/state/constants/firebase_collection_name.dart';
import 'package:instagram_clone/state/constants/firebase_field_name.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_comment.g.dart';

@riverpod
Stream<Iterable<Comment>> postComment(ref, RequestForPostAndComments request) {
  final controller = StreamController<Iterable<Comment>>();

  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionName.comments)
      .where(FirebaseFieldName.postId, isEqualTo: request.postId)
      .snapshots()
      .listen((snapshot) {
    final documents = snapshot.docs;
    final limitedDocuments =
        request.limit != null ? documents.take(request.limit!) : documents;
    final comments =
        limitedDocuments.where((doc) => !doc.metadata.hasPendingWrites).map(
              (document) => Comment(
                id: document.id,
                document.data(),
              ),
            );
    final result = comments.applySortingFrom(request);

    controller.sink.add(result);
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
}
