import 'package:easy_travel/features/auth/domain/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
}
