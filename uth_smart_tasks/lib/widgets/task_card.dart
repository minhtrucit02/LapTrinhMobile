import 'dart:math';
import 'package:flutter/material.dart';
import 'package:uth_smart_tasks/models/data.dart';
import 'package:uth_smart_tasks/models/enum_data.dart';

class TaskCard extends StatelessWidget {
  final Data task;
  final VoidCallback? onTap;
  final ValueChanged<bool?>? onChanged;

  const TaskCard({
    super.key,
    required this.task,
    this.onTap,
    this.onChanged,
  });

  Color getSoftRandomColor({double brightnessFactor = 0.7}) {
    final random = Random();
    int scale(int value) => (value * brightnessFactor).clamp(0, 255).toInt();

    return Color.fromARGB(
      255,
      scale(random.nextInt(256)),
      scale(random.nextInt(256)),
      scale(random.nextInt(256)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = getSoftRandomColor();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              value: true,
              onChanged: onChanged,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(task.description),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Status: ${task.status.displayName}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        task.createdAt,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
