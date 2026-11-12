import 'package:easy_travel/features/comments/infrastructure/user_dto.dart';

class CommentDto {
  final UserDto user;
  final int id;
  final String comment;
  final int rating;
  final String createdAt;

  const new({
    required this.user,
    required this.id,
    required this.comment,
    required this.rating,
    required this.createdAt,
  });

  factory CommentDto.fromJson(Map<String, dynamic> json) {
    return CommentDto(
      user: UserDto.fromJson(json['user']),
      id: (json['destinationId'] as num).toInt(),
      comment: json['comment'],
      rating: (json['rating'] as num).toInt(),
      createdAt: json['date'],
    );
  }
}
