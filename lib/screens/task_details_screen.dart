import 'package:flutter/material.dart';
import '../data/models/task_model.dart';
import 'widgets/task_details.dart';

class TaskDetailsScreen extends StatelessWidget {
  final Task task;

  const TaskDetailsScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TaskDetailsWidget(task: task),
      ),
    );
  }
}
