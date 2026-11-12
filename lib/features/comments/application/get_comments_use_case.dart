import 'package:easy_travel/features/comments/domain/comment.dart';
import 'package:easy_travel/features/comments/domain/comment_repository.dart';

class GetCommentsUseCase {
  final CommentRepository _repository;

  new({required this._repository});

  Future<List<Comment>> execute() async {
    return await _repository.getComments();
  }
}