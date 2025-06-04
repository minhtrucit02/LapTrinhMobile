import 'package:flutter/material.dart';
import 'package:homework4_ex3/confirm.dart';
import 'package:homework4_ex3/create_new_password.dart';
import 'package:homework4_ex3/verify_code.dart';
import 'package:homework4_ex3/forget_password.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ForgetPassword(),
    );
  }
}
