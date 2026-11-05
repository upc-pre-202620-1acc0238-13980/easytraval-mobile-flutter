import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const new({super.key, this.controller});
  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
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
            isHiddenPassword ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ),
    );
  }
}
