import 'package:flutter/material.dart';
import 'package:homework4_ex3/components/button_component.dart';
import 'package:homework4_ex3/components/component.dart';

class Confirm extends StatelessWidget {
  const Confirm({
    super.key,
    required this.email,
    required this.code,
    required this.password,
  });
  final String email;
  final String code;
  final String password;

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController(
      text: email,
    );
    final TextEditingController codeController = TextEditingController(
      text: code,
    );
    final TextEditingController passwordController = TextEditingController(
      text: password,
    );
    final title = 'Confirm';
    final description = 'We are here to help you.';
    return Scaffold(
      body: Column(
        children: [
          UTHComponent(title: title, description: description),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: codeController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.confirmation_number),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          ButtonComponent(buttonTitle: 'Submit', onTap: () {}),
          Spacer(),
        ],
      ),
    );
  }
}
