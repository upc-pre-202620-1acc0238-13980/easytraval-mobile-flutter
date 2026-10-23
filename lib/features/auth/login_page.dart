import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hint: Text("Email"),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: TextField(
                obscureText: isHiddenPassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hint: Text("Password"),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isHiddenPassword = !isHiddenPassword;
                      });
                    },
                    icon: Icon(
                      isHiddenPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(onPressed: () {}, child: Text("Sign in")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
