import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uth_smart_tasks/screen_color.dart';
import 'package:uth_smart_tasks/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeColor = ref.watch(themeColorProvider);

    return MaterialApp(
      title: 'UTH Smart Tasks',
      theme: ThemeData(
        primaryColor: themeColor,
        appBarTheme: AppBarTheme(
          backgroundColor: themeColor,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: themeColor),
        ),
      ),
      home: const ScreenColor(),
    );
  }
}
