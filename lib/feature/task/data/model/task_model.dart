class TaskModel {
  final String id;
  final String title;
  final String note;
  final String startTime;
  final String endTime;
  final bool isCompleted;
  final int color;

  TaskModel({
    required this.id,
    required this.title,
    required this.note,
    required this.startTime,
    required this.endTime,
    required this.isCompleted,
    required this.color,
  });
  static List<TaskModel> tasksList = [
    TaskModel(
      id: '1',
      title: 'Flutter',
      note: 'Learn Dart',
      startTime: '09:33 PM',
      endTime: '09:45 PM',
      isCompleted: false,
      color: 1,
    ),
    TaskModel(
      id: '2',
      title: 'NodeJS',
      note: 'Learn JavaScript',
      startTime: '09:33 PM',
      endTime: '09:45 PM',
      isCompleted: true,
      color: 3,
    ),
  ];
}
