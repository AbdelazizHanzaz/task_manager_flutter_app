

import 'package:flutter/material.dart';
import 'package:task_manager_flutter_app/screens/deleted_tasks_screen.dart';

import '../screens/tasks_screen.dart';

class ScreenUtils {

  static const String tasksScreenTitle = "Tasks";
  static const String completedTasksScreenTitle = "Completed Tasks";
  static const String deletedTasksScreenTitle = "Deleted Tasks";

  static Widget getScreen(int index) {
    switch (index) {
      case 0:
        return const TasksScreen();
      case 1:
        return Container();
      case 2:
        return const DeletedTasksScreen();
      default:
        return Container();
    }
  }

  static String getTitle(int index) {
    switch (index) {
      case 0:
        return tasksScreenTitle;
      case 1:
        return completedTasksScreenTitle;
      case 2:
        return deletedTasksScreenTitle;
      default:
        return 'No Title';
    }
  }

  static IconData getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.list;
      case 1:
        return Icons.done;
      case 2:
        return Icons.delete;
      default:
        return Icons.error;
    }
  }
}
