import 'package:flutter/material.dart';
import 'package:homework4_ex3/components/button_component.dart';
import 'package:homework4_ex3/components/component.dart';
import 'package:homework4_ex3/verify_code.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    final title = 'Forget password';
    final description =
        'Enter your email, we will send you a verification code.';
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UTHComponent(title: title, description: description),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Your Email",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ButtonComponent(
            buttonTitle: "Next",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VerifyCode(email: emailController.text),
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
