import 'package:flutter/material.dart';

class UTHComponent extends StatelessWidget {
  const UTHComponent({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 150),
        Image.asset('assets/uth.png', height: 100),
        Text(
          "SmartTasks",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(description, textAlign: TextAlign.center),
      ],
    );
  }
}
