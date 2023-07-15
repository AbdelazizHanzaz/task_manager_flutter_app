import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_flutter_app/routes/app_routes.dart';
import 'package:task_manager_flutter_app/widgets/task_list.dart';

import '../data/provider.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final tasks = taskProvider.tasks;
    //final isLoading = taskProvider.isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: tasks.isNotEmpty
          ? TaskList(tasks: tasks)
          : const Center(
              child: Text('No tasks yet. Add a task to get started.'),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.pushNamed(context, AppRouters.createTask),
        child: const Icon(Icons.add, size: 24,),
        ),
    );
  }
}
