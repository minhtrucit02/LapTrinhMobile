import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget {
  final int currentIndex;
  final int pagesLength;
  final Function(int) onDotTap;
  final VoidCallback onSkip;

  const AppBarComponent({
    super.key,
    required this.currentIndex,
    required this.pagesLength,
    required this.onDotTap,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: List.generate(
              pagesLength,
                  (index) => GestureDetector(
                onTap: () => onDotTap(index),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index
                        ? Colors.blue
                        : Colors.grey.shade300,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onSkip,
            child: const Text(
              "Skip",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
