import 'package:flutter/material.dart';

import 'models/task_model.dart';

class TaskProvider with ChangeNotifier {
  //final bool _isLoading = true;
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

   List<Task> get completedTasks => _tasks.where((task) => task.isCompleted).toList();

  //get isLoading => _isLoading;

  void saveTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task updatedTask) {
    final index = _tasks.indexWhere((task) => task.title == updatedTask.title);
    if (index >= 0) {
      _tasks[index] = updatedTask;
      notifyListeners();
    }
  }

  void deleteTask(String taskTitle) {
    _tasks.removeWhere((task) => task.title == taskTitle);
    notifyListeners();
  }

   List<Task> get deletedTasks {
    //return _tasks.where((task) => task.isDeleted).toList();
    return _tasks.where((task) => true).toList();
  }

  void markTaskAsCompleted(String taskTitle) {
    final index = _tasks.indexWhere((task) => task.title == taskTitle);
    if (index >= 0) {
      _tasks[index].isCompleted = true;
      notifyListeners();
    }
  }

  void markTaskAsIncomplete(String taskTitle) {
    final index = _tasks.indexWhere((task) => task.title == taskTitle);
    if (index >= 0) {
      _tasks[index].isCompleted = false;
      notifyListeners();
    }
  }

  void clearTasks() {
    _tasks.clear();
    notifyListeners();
  }
}
