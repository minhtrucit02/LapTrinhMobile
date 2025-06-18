import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uth_smart_tasks/models/enum_data.dart';
import '../viewModels/povider/smart_task_provider.dart';
import '../widgets/task_info_tile.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(selectedTaskProvider);
    if (task == null) {
      return const Scaffold(body: Center(child: Text('No task selected')));
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Detail', style: TextStyle(color: Colors.blue)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.orange,
              size: 28,
            ),
            onPressed: () {
              // TODO: Xử lý xóa task
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              task.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              task.description,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),

            //TODO: information task
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TaskInfoTile(Icons.work, 'Category', task.category),
                  TaskInfoTile(
                    Icons.assignment,
                    'Status',
                    task.status.displayName,
                  ),
                  TaskInfoTile(Icons.priority_high, 'Priority', task.priority),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              'Subtasks',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            //TODO: list subtask
            Column(
              children: List.generate(task.subtasks.length, (index) {
                final subtask = task.subtasks[index];
                print(subtask.isCompleted);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          value: subtask.isCompleted,
                          onChanged: null,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            subtask.title,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 16),
            const Text(
              'Attachments',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            //TODO: Attachment
            Column(
              children: List.generate(task.attachments.length, (index) {
                final attachment = task.attachments[index];
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.attach_file, color: Colors.black),
                      SizedBox(width: 10),
                      Text(attachment.fileName, style: TextStyle(fontSize: 14)),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
