import 'dart:ui';

class Task {
  final String title;
  final String description;
  final String status;
  final DateTime dateTime;
  final Color color;
  final bool isChecked;

  Task({
    required this.title,
    required this.description,
    required this.status,
    required this.dateTime,
    required this.color,
    this.isChecked = false,
  });
}