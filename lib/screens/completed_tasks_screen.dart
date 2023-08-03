
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_flutter_app/screens/widgets/task_list.dart';

import '../data/provider.dart';

class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({super.key});

 @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    taskProvider.fetchTasks();
  
    return taskProvider.taskDataState == TaskDataState.loading
          ? const Center(child: CircularProgressIndicator(),)
          : taskProvider.taskDataState == TaskDataState.empty 
          ? const Center(child: Text("No tasks available"))
          : taskProvider.taskDataState == TaskDataState.error
          ? const Center(child: Text("Fetching tasks failed!"))
          : TaskList(tasks: taskProvider.completedTasks);
    
              
  }
}
