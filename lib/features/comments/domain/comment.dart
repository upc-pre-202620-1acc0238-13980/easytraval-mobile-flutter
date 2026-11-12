import 'package:easy_travel/features/auth/domain/user.dart';

class Comment {
  final User user;
  final int id;
  final String comment;
  final int rating;
  final DateTime createdAt;

  const new({
    required this.user,
    required this.id,
    required this.comment,
    required this.rating,
    required this.createdAt,
  });
}
