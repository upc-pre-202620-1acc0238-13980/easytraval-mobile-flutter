import 'package:easy_travel/features/auth/domain/user.dart';

sealed class LoginState {}

class LoginInital extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final User user;
  new({required this.user});
}

class LoginFailure extends LoginState {
  final String message;
  new({required this.message});
}
