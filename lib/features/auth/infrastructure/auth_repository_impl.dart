import 'package:easy_travel/core/token_storage.dart';
import 'package:easy_travel/features/auth/domain/auth_repository.dart';
import 'package:easy_travel/features/auth/domain/user.dart';
import 'package:easy_travel/features/auth/infrastructure/remote/auth_api.dart';
import 'package:easy_travel/features/auth/infrastructure/remote/login_response_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _api;
  final TokenStorage _storage;
  const new({required this._api, required this._storage});

  @override
  Future<User> login(String email, String password) async {
    final LoginResponseDto dto = await _api.login(email, password);

    final user = User(
      firstName: dto.firstName,
      lastName: dto.lastName,
      email: dto.email,
    );

    await _storage.saveToken(dto.token);
    return user;
  }
}
