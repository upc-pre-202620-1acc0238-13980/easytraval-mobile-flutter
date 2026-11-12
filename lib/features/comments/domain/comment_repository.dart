import 'package:easy_travel/features/comments/domain/comment.dart';

abstract class CommentRepository {
  Future<void> addComment(int id, String comment, int rating);
  Future<List<Comment>> getComments();
}