import 'package:flutter/material.dart';

class Practise2Components extends StatelessWidget {
  const Practise2Components({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  final String imagePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        Image.asset('assets/$imagePath'),
        const SizedBox(height: 16),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
