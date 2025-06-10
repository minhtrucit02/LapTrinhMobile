import 'package:flutter/material.dart';
import 'package:homework4_ex3/components/button_component.dart';
import 'package:homework4_ex3/components/component.dart';
import 'package:homework4_ex3/confirm.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({
    super.key,
    required this.email,
    required this.code,
  });

  final String email;
  final String code;

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _onNext() {
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      _showMessage('Passwords do not match');
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Confirm(
          email: widget.email,
          code: widget.code,
          password: password,
        ),
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Create New Password';
    final description = 'Your new password must be different from previously used password.';

    return Scaffold(
      body: Column(
        children: [
          UTHComponent(title: title, description: description),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Confirm Password",
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          ButtonComponent(
            buttonTitle: 'Next',
            onTap: _onNext,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
