

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_flutter_app/widgets/task_widget.dart';

import '../data/provider.dart';

class DeletedTasksScreen extends StatelessWidget {
  const DeletedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final deletedTasks = taskProvider.deletedTasks;

    return deletedTasks.isEmpty
          ? const Center(
              child: Text('No deleted tasks.'),
            )
          : ListView.builder(
              itemCount: deletedTasks.length,
              itemBuilder: (context, index) {
                final task = deletedTasks[index];
                return TaskWidget(task: task, taskColor: Colors.red.shade200,);
              },
            );
  }
}
