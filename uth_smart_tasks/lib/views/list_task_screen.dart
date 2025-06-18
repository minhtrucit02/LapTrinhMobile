import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListTaskScreen extends ConsumerWidget {
  const ListTaskScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('List', style: TextStyle(color: Colors.blue)),
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
    );
  }
}
