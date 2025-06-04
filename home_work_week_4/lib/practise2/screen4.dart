import 'package:flutter/material.dart';
import 'package:home_work_week_4/components/practise2_components.dart';
import 'package:home_work_week_4/practise2/screen1.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    final imagePath = "screen4.png";
    final title = "Reminder Notification";
    final description = "The advantage of this application is that is also provides reminders for you so you don't forget"
        "to keep doing your assignments well and according to the time you have set.";
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
              //             MaterialPageRoute(builder: (context) => const Screen1()));
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
