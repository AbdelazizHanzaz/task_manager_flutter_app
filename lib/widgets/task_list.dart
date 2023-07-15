import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_flutter_app/data/provider.dart';
import 'package:task_manager_flutter_app/widgets/task_card_item.dart';

import '../data/models/task_model.dart';


class TaskList extends StatelessWidget {
  final List<Task> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskCard(
          task: task,
          onMarkAsCompleted: () {
            // Handle mark as completed action
          },
          onDelete: () {
            // Handle delete action
            taskProvider.deleteTask(task.title);
          },
        );
      },
    );
  }
}
