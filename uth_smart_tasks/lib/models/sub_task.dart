class SubTask {
  SubTask({required this.id, required this.title, required this.isCompleted});
  final int id;
  final String title;
  final bool isCompleted;

  factory SubTask.fromJson(Map<String, dynamic> data) {
    return SubTask(id: data['id'], title: data['title'] ?? '', isCompleted: data['isCompleted'] ?? false);
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'isCompleted': isCompleted,
  };
}
