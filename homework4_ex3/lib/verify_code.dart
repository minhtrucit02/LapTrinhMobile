import 'package:flutter/material.dart';
import 'package:homework4_ex3/components/button_component.dart';
import 'package:homework4_ex3/components/component.dart';
import 'package:homework4_ex3/create_new_password.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> codeControllers = List.generate(
      6,
      (_) => TextEditingController(),
    );

    final title = 'Verify Code';
    final description =
        'Enter the code we just sent you on your registered Email';
    return Scaffold(
      body: Column(
        children: [
          UTHComponent(title: title, description: description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(6, (index) {
              return SizedBox(
                width: 30,
                child: TextField(
                  controller: codeControllers[index],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  decoration: InputDecoration(counterText: ""),
                ),
              );
            }),
          ),
          const SizedBox(height: 20,),
          ButtonComponent(
            buttonTitle: 'Next',
            onTap: () {
              final code = codeControllers.map((e) => e.text).join();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => CreateNewPassword(email: email, code: code),
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
