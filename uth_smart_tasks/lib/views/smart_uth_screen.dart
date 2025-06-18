import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uth_smart_tasks/views/detail_screen.dart';

import '../viewModels/povider/home_provider.dart';
import '../viewModels/povider/smart_task_provider.dart';
import '../widgets/task_card.dart';

class SmartUthScreen extends ConsumerStatefulWidget {
  const SmartUthScreen({super.key});

  @override
  ConsumerState<SmartUthScreen> createState() => _SmartUthScreenState();
}

class _SmartUthScreenState extends ConsumerState<SmartUthScreen> {

  void _onItemTapped(int index) {
    ref.read(selectIndexHome.notifier).state = index;
    switch (index) {
      case 0: // Home
        break;
      case 1: // Date
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Navigating to date...')),
        );
        break;
      case 2: // Add
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Navigating to add...')),
        );
        break;
      case 3: // Description

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailScreen()),
        );
        break;
      case 4: // Setting
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Navigating to setting...')),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final smartTaskAsync = ref.watch(smartTaskListProvider);
    final selectedIndex = ref.watch(selectIndexHome);

    return smartTaskAsync.when(
      data: (tasks) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Image.network(
                  'https://giaothongvantaitphcm.edu.vn/wp-content/uploads/2025/01/Logo-GTVT.png',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(width: 8),
                const Text('SmartTasks'),
              ],
            ),
          ),
          body: tasks.isEmpty
              ? const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.assignment_turned_in, size: 80, color: Colors.grey),
                SizedBox(height: 16),
                Text('No Tasks Yet!', style: TextStyle(fontSize: 20)),
                Text('Stay productive—add something to do'),
              ],
            ),
          )
              : ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TaskCard(
                task: tasks[index],
                onTap: () {
                  ref.read(selectedTaskProvider.notifier).state = tasks[index];
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DetailScreen()),
                  );
                },
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.date_range_outlined), label: 'Date'),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle, color: Colors.blue, size: 36),
                label: '',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.description), label: 'Description'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Lỗi: $err')),
    );
  }
}
