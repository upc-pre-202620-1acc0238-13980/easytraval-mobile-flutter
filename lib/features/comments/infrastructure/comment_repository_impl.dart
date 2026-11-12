import 'package:easy_travel/features/comments/domain/comment.dart';
import 'package:easy_travel/features/comments/domain/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  @override
  Future<List<Comment>> getComments() {
    throw UnimplementedError();
  }

  @override
  Future<void> addComment(int id, String comment, int rating) {
    throw UnimplementedError();
  }
}