import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeColorProvider = StateNotifierProvider<ThemeColorNotifier, Color>(
      (ref) => ThemeColorNotifier(),
);

class ThemeColorNotifier extends StateNotifier<Color> {
  ThemeColorNotifier() : super(Colors.blue) {
    _loadThemeColor();
  }

  Future<void> _loadThemeColor() async {
    final prefs = await SharedPreferences.getInstance();
    final colorValue = prefs.getInt('theme_color');
    if (colorValue != null) {
      state = Color(colorValue);
    }
  }

  Future<void> updateColor(Color newColor) async {
    state = newColor;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme_color', newColor.value);
  }
}
