

import 'package:flutter/material.dart';
import 'package:task_manager_flutter_app/data/models/task_model.dart';
import 'package:task_manager_flutter_app/screens/create_task_screen.dart';
import 'package:task_manager_flutter_app/screens/edit_task_screen.dart';
import 'package:task_manager_flutter_app/screens/task_details_screen.dart';
import 'package:task_manager_flutter_app/screens/tasks_screen.dart';



class AppRouters {
  
  static const String tasks = '/tasks';
  static const String createTask = '/create-task';
  static const String editTask = '/edit-task';
  static const String taskDetails = '/task-details';


  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case tasks:
        return MaterialPageRoute(builder: (_) => const TasksScreen());
      case createTask:
        return MaterialPageRoute(builder: (_) => const CreateTaskScreen());
      case editTask:
        final taskToEdit = settings.arguments as Task;
        return MaterialPageRoute(builder: (_) => EditTaskScreen(taskToEdit: taskToEdit));
      case taskDetails:
        final task = settings.arguments as Task;
        return MaterialPageRoute(builder: (_) => TaskDetailsScreen(task: task));
      default:
        return null;
    }
  }
}
