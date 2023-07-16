
import 'package:flutter/material.dart';

import '../data/models/task_model.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  final Color taskColor;

  const TaskWidget({super.key, 
    required this.task,
    this.taskColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          color: taskColor,
          fontWeight: task.isCompleted ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      subtitle: Text(task.description),
      onTap: () {
        // Handle task onTap action if needed
      },
    );
  }
}
