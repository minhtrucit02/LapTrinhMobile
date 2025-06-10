import 'package:flutter/material.dart';
import 'package:homework4_ex3/components/button_component.dart';
import 'package:homework4_ex3/components/component.dart';
import 'package:homework4_ex3/verify_code.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  void _onNext() {
    final email = emailController.text.trim();
    if (_isValidEmail(email)) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerifyCode(email: email),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid email address')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Your Email",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ButtonComponent(
            buttonTitle: "Next",
            onTap: _onNext,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
