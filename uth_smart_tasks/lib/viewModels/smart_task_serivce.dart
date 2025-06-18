import 'package:uth_smart_tasks/models/smart_task.dart';

import '../models/data.dart';

abstract class SmartTaskService{
  Future<List<Data>> getAllData();
}