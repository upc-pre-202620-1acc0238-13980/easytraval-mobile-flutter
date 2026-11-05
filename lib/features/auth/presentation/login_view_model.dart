import 'package:easy_travel/features/auth/application/login_use_case.dart';
import 'package:easy_travel/features/auth/domain/user.dart';
import 'package:easy_travel/features/auth/presentation/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewModel extends Cubit<LoginState> {
  final LoginUseCase _login;
  new({required this._login}) : super(LoginInital());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());

    try {
      final User user = await _login.execute(email, password);
      emit(LoginSuccess(user: user));
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}
