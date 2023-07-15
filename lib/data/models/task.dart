import '../constants/constants.dart';
import 'category.dart';

class Task {

  final String id;
  final String title;
  final Priority priority;
  final Category category;
  final TaskStatus status;
  final DateTime dueDate;

  
  const Task({
    required this.id,
    required this.title, 
    this.priority = Priority.medium,
    required this.category,
    this.status = TaskStatus.inProgress,
    required this.dueDate
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      title: json['title'] as String,
      priority: Priority.values.byName(json['priority']),  
      category: Category.fromJson(json['category']),
      status: TaskStatus.values.byName(json['status']),
      dueDate: DateTime.parse(json['dueDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'priority': priority.name,
      'category': category.toJson(),
      'status': status.name,
      'dueDate': dueDate.toIso8601String(),
    };
  }

}