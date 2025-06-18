import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme_provider.dart';

class ScreenColor extends ConsumerStatefulWidget {
  const ScreenColor({super.key});

  @override
  ConsumerState<ScreenColor> createState() => _ScreenColorState();
}

class _ScreenColorState extends ConsumerState<ScreenColor> {
  Color? selectedColor;

  final List<Color> themeColors = [
    Colors.lightBlue,
    Colors.pinkAccent,
    Colors.black87,
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Theme Setting")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Setting',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Choosing the right theme sets the tone and personality of your app.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: themeColors.map((color) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                    child: Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selectedColor == color
                              ? Colors.blue
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (selectedColor != null) {
                    ref
                        .read(themeColorProvider.notifier)
                        .updateColor(selectedColor!);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Theme applied!')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please select a theme first.')),
                    );
                  }
                },
                child: const Text(
                  'Apply',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
