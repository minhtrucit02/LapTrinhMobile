import 'package:uth_smart_tasks/models/attachment.dart';
import 'package:uth_smart_tasks/models/enum_data.dart';
import 'package:uth_smart_tasks/models/reminder.dart';
import 'package:uth_smart_tasks/models/sub_task.dart';

class Data {
  final int id;
  final String title;
  final String description;
  final DataStatus status;
  final String priority;
  final String category;
  final String dueDate;
  final String createdAt;
  final String updatedAt;
  final List<SubTask> subtasks;
  final List<Attachment> attachments;
  final List<Reminder> reminders;

  Data({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.category,
    required this.dueDate,
    required this.createdAt,
    required this.updatedAt,
    required this.subtasks,
    required this.attachments,
    required this.reminders,
  });

  factory Data.fromJson(Map<String, dynamic> data) {
    return Data(
      id: data['id'],
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      status: _parseStatus(data['status']),
      priority: data['priority'] ?? '',
      category: data['category'] ?? '',
      dueDate: data['dueDate'] ?? '',
      createdAt: data['createdAt'] ?? '',
      updatedAt: data['updatedAt'] ?? '',
      subtasks: (data['subtasks'] as List<dynamic>?)
          ?.map((e) => SubTask.fromJson(e))
          .toList() ??
          [],
      attachments: (data['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e))
          .toList() ??
          [],
      reminders: (data['reminders'] as List<dynamic>?)
          ?.map((e) => Reminder.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'status': status.name,
    'priority': priority,
    'category': category,
    'dueDate': dueDate,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'subtasks': subtasks.map((e) => e.toJson()).toList(),
    'attachments': attachments.map((e) => e.toJson()).toList(),
    'reminders': reminders.map((e) => e.toJson()).toList(),
  };

  static DataStatus _parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'in progress':
        return DataStatus.inProgress;
      case 'pending':
        return DataStatus.pending;
      case 'completed':
        return DataStatus.completed;
      default:
        return DataStatus.pending;
    }
  }
}
