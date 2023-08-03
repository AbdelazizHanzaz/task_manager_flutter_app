import 'package:flutter/material.dart';
import '../../data/models/task_model.dart';

class TaskDetailsWidget extends StatelessWidget {
  final Task task;

  const TaskDetailsWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          task.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Description:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          task.description,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        const Text(
          'Due Date:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          task.dueDate.toString(),
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        const Text(
          'Status:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          task.isCompleted ? 'Completed' : 'Incomplete',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
