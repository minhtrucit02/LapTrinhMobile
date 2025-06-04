import 'package:flutter/material.dart';
import 'package:home_work_week_4/practise2/screen1.dart';
import 'package:home_work_week_4/practise2/screen2.dart';
import 'package:home_work_week_4/practise2/screen3.dart';
import 'package:home_work_week_4/practise2/screen4.dart';

import '../components/app_bar.dart'; // component appbar riêng

class PageControllerScreen extends StatefulWidget {
  const PageControllerScreen({super.key});

  @override
  State<PageControllerScreen> createState() => _PageControllerScreenState();
}

class _PageControllerScreenState extends State<PageControllerScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<Widget> pages = const [
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  void _goToPage(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _skipToEnd() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Screen1()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarComponent(
          currentIndex: currentIndex,
          pagesLength: pages.length,
          onDotTap: _goToPage,
            onSkip: _skipToEnd,
        ),
      ),
      body: PageView.builder(
        controller: _controller,
        itemCount: pages.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: pages[index]),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (currentIndex > 0)
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: const CircleBorder(),
                        ),
                        onPressed: () => _goToPage(currentIndex - 1),
                      )
                    else
                      const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            if (currentIndex < pages.length - 1) {
                              _goToPage(currentIndex + 1);
                            } else {
                              _skipToEnd();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Text(
                            currentIndex < pages.length - 1
                                ? "Next"
                                : "Get Started",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}
