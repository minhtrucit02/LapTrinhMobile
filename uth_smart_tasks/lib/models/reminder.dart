class Reminder{
  Reminder({
    required this.id,
    required this.time,
    required this.type,
});
  final int id;
  final String time;
  final String type;

  factory Reminder.fromJson(Map<String, dynamic> data) {
    return Reminder(id: data['id'], time: data['time'] ?? '', type: data['type'] ?? '');
  }

  Map<String,dynamic> toJson() => {
    'id':id,
    'time': time,
    'type': type,
  };
}