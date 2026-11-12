import 'dart:convert';
import 'dart:io';

import 'package:easy_travel/core/token_storage.dart';
import 'package:easy_travel/features/comments/infrastructure/comment_dto.dart';
import 'package:http/http.dart' as http;

class CommentApi {
  final TokenStorage _storage;
  const new({required this._storage});

  final String url =
      'https://destinationapp-h4e8dvace3fqffbb.eastus-01.azurewebsites.net/api/comments/';

  Future<List<CommentDto>> getComments(int id) async {
    final Uri uri = Uri.parse('$url$id');
    http.Response response = await http.get(uri);
    if (response.statusCode == HttpStatus.ok) {
      final List data = jsonDecode(response.body);
      return data.map((e) => CommentDto.fromJson(e)).toList();
    }
    throw Exception('Failed to load comments');
  }

  Future<void> addComment(int id, String comment, int rating) async {
    final Uri uri = Uri.parse(url);
    final token = await _storage.getToken();
    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'destinationId': id,
        'comment': comment,
        'rating': rating,
      }),
    );
    if (response.statusCode != HttpStatus.created) {
      throw Exception('Failed to add comment');
    }
  }
}
