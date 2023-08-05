class TaskModel {
  final String id;
  final String title;
  final String note;
  final String startTime;
  final String endTime;
  final String date;
  final bool isCompleted;
  final int color;

  TaskModel({
    required this.id,
    required this.date,
    required this.title,
    required this.note,
    required this.startTime,
    required this.endTime,
    required this.isCompleted,
    required this.color,
  });
}
