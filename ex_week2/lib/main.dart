import 'package:ex_week2/ExceriseWeek2.dart';
import 'package:ex_week2/practice1.dart';
import 'package:ex_week2/practice_2_week_3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Practice3(),
    );
  }
}
