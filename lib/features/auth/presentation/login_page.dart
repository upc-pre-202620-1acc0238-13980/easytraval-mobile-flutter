import 'package:easy_travel/features/auth/presentation/login_state.dart';
import 'package:easy_travel/features/auth/presentation/login_view_model.dart';
import 'package:easy_travel/features/auth/presentation/password_text_field.dart';
import 'package:easy_travel/features/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  new({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginViewModel, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Welcome: ${state.user.firstName} ${state.user.lastName}',
              ),
            ),
          );
        }

        if (state is LoginFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) => Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hint: Text("Email"),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: PasswordTextField(controller: password),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () => context.read<LoginViewModel>().login(
                          email.text,
                          password.text,
                        ),
                        child: Text("Sign in"),
                      ),
                    ),
                  ),
                ],
              ),

              if (state is LoginLoading)
                Container(
                  color: Theme.of(context).colorScheme.surface.withAlpha(200),
                  child: Center(child: CircularProgressIndicator())),
            ],
          ),
        ),
      ),
    );
  }
}
