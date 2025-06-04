import 'package:flutter/material.dart';
import 'package:home_work_week_4/components/app_bar.dart';
import 'package:home_work_week_4/components/practise2_components.dart';
import 'package:home_work_week_4/practise2/screen3.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    final imagePath = "screen2.png";
    final title = "Easy Time Management";
    final description = "With management based on priority and daily tasks, it will give you"
        "convenience in managing and determining the tasks that must be done first";
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
              //             MaterialPageRoute(builder: (context) => const Screen3()));
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
