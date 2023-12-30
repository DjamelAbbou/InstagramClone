import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/state/comments/typedefs/id.dart';
import 'package:instagram_clone/state/constants/firebase_collection_name.dart';
import 'package:instagram_clone/state/image_upload/typedefs/is_loading.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_comment.g.dart';

@riverpod
class DeleteCommentStateNotifier extends _$DeleteCommentStateNotifier {
  @override
  IsLoading build() => false;

  set isLoading(value) => state = value;

  Future<bool> deleteComment({
    required CommentId commentId,
  }) async {
    try {
      isLoading = true;
      final query = FirebaseFirestore.instance
          .collection(FirebaseCollectionName.comments)
          .where(FieldPath.documentId, isEqualTo: commentId)
          .limit(1)
          .get();

      await query.then(
        (result) async {
          for (final doc in result.docs) {
            await doc.reference.delete();
          }
        },
      );
      return true;
    } catch (_) {
      return false;
    } finally {
      return false;
    }
  }
}
