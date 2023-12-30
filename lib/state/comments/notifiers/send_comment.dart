import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/state/comments/models/payload.dart';
import 'package:instagram_clone/state/constants/firebase_collection_name.dart';
import 'package:instagram_clone/state/constants/firebase_field_name.dart';
import 'package:instagram_clone/state/posts/typedefs/post_id.dart';
import 'package:instagram_clone/state/posts/typedefs/user_id.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'send_comment.g.dart';

@riverpod
class SendCommentNotifier extends _$SendCommentNotifier {
  @override
  bool build() => false;

  set isLoading(bool value) => state = value;

  Future<bool> sendComment({
    required UserId userId,
    required String comment,
    required PostId onPostId,
  }) async {
    isLoading = true;
    try {
      final payload = CommentPayload(
          fromUserId: userId, comment: comment, onPostId: onPostId);
      final query = await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.comments)
          .add(payload);

      return true;
    } catch (_) {
      isLoading = false;
      return false;
    } finally {
      isLoading = false;
    }
  }
}
