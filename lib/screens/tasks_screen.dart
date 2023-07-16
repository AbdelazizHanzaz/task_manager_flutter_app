import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_flutter_app/widgets/task_list.dart';

import '../data/provider.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final tasks = taskProvider.tasks;
    //final isLoading = taskProvider.isLoading;

    return tasks.isNotEmpty
          ? TaskList(tasks: tasks)
          : const Center(
              child: Text('No tasks yet. Add a task to get started.'),
            );
  }
}
