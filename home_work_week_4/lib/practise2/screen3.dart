import 'package:flutter/material.dart';
import 'package:home_work_week_4/components/practise2_components.dart';
import 'package:home_work_week_4/practise2/screen4.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    final imagePath = "screen3.png";
    final title = "Increase Work Effectiveness";
    final description = "Time management and the determination at more important tasks will "
        "give your job statistics better and always improve";
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Practise2Components(imagePath: imagePath, title: title, description: description),

              // Padding(
              //   padding: const EdgeInsets.only(bottom: 24),
              //   child: SizedBox(
              //     width: double.infinity,
              //     height: 48,
              //     child: ElevatedButton(
              //       onPressed: () {
              //         Navigator.push(context,
              //             MaterialPageRoute(builder: (context) => const Screen4()));
              //       },
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: Colors.blue,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(24),
              //         ),
              //       ),
              //       child: const Text(
              //         "Next",
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
