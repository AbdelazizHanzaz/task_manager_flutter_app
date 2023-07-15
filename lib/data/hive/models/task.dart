

// Annotate as HiveType
import 'package:hive/hive.dart';

import '../../constants/constants.dart';
import 'category.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;  

  @HiveField(2)
  final Priority priority;

  @HiveField(3)
  final Category category;
   
  @HiveField(4)
  final TaskStatus status;

  @HiveField(5)
  final DateTime dueDate;

  Task({
   required this.id,
   required this.title,
   this.priority = Priority.medium,
   required this.category,
   this.status = TaskStatus.inProgress, 
   required this.dueDate
  });

}