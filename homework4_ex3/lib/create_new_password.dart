import 'package:flutter/material.dart';
import 'package:homework4_ex3/components/button_component.dart';
import 'package:homework4_ex3/components/component.dart';
import 'package:homework4_ex3/confirm.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key, required this.email, required this.code});
  final String email;
  final String code;

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    final title = 'Create New Password';
    final description =
        'Your new password must be different form previously user password';
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
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => Confirm(
                        email: email,
                        code: code,
                        password: passwordController.text,
                      ),
                ),
              );
            },
          ),
          Spacer(),
        ],
      ),
    );
  }
}
