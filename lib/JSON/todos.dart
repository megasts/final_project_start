
class Todos {
  final int userTaskId;
  final int taskId;
  final String title;
  final bool completed;

  Todos({
    required this.userTaskId,
    required this.taskId,
    required this.title,
    required this.completed,
  });

  factory Todos.fromJson(Map<String, dynamic> json) {
    return Todos(
      userTaskId: json['userId'] as int,
      taskId: json['id'] as int,
      title: json['title'] as String,
      completed:json['completed'] as bool,
    );
  }
}

