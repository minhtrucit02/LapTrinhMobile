import 'package:uth_smart_tasks/models/data.dart';

class SmartTask {
  SmartTask({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  final bool isSuccess;
  final String message;
  final List<Data> data;

  factory SmartTask.fromJson(Map<String, dynamic> json) {
    return SmartTask(
      isSuccess: json['isSuccess'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
    'isSuccess': isSuccess,
    'message': message,
    'data': data.map((e) => e.toJson()).toList(),
  };
}
