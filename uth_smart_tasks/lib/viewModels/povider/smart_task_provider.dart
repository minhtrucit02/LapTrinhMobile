import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uth_smart_tasks/models/data.dart';
import 'package:uth_smart_tasks/models/smart_task.dart';
import 'package:uth_smart_tasks/viewModels/Ipml/smart_task_service_impl.dart';
import 'package:uth_smart_tasks/viewModels/smart_task_serivce.dart';

final selectedTaskProvider = StateProvider<Data?>((ref) => null);

final smartTaskServiceProvider = Provider<SmartTaskService>((ref) {
  return SmartTaskServiceImpl();
});

final smartTaskListProvider = FutureProvider<List<Data>>((ref) async {
  final service = ref.read(smartTaskServiceProvider);
  return await service.getAllData();
});
