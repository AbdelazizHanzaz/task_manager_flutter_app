

import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String description;

  @HiveField(2)
  late DateTime dueDate;

  @HiveField(3)
  late bool isCompleted;
  
  @HiveField(4)
  late bool isDeleted;
  Task({
    required this.title,
    required this.description,
    required this.dueDate,
    this.isCompleted = false,
    this.isDeleted = false,
  });
}
