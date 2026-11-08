import 'package:easy_travel/core/token_storage.dart';
import 'package:http/http.dart' as http;

class HttpClient extends http.BaseClient {
  final http.Client _inner;
  final TokenStorage _tokenStorage;

  new({required this._inner, required this._tokenStorage});

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final token = await _tokenStorage.getToken();
    if (token != null) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['Authorization'] = 'Bearer $token';
    }
    return _inner.send(request);
  }
}