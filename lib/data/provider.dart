import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_manager_flutter_app/data/services/hive_service.dart';

import 'models/task_model.dart';


enum TaskDataState {
  loading, 
  loaded, 
  error,   
  empty,   
}

class TaskProvider with ChangeNotifier {

  late HiveService _hiveService;
  List<Task> _tasks = [];
  TaskDataState _taskDataState = TaskDataState.loading;

   List<Task> get tasks => _tasks;
   List<Task> get completedTasks => _tasks.where((task) => task.isCompleted && !task.isDeleted).toList();
   List<Task> get noCompletedTasks => _tasks.where((task) => !task.isCompleted && !task.isDeleted).toList();
   List<Task> get deletedTasks => _tasks.where((task) => task.isDeleted).toList();

   TaskDataState get taskDataState => _taskDataState;


  TaskProvider(){
    _hiveService = HiveService();
    log("task provider");
  }

  void fetchTasks() async{
    try{
      await Future.delayed(const Duration(seconds: 2));

      _tasks = await _hiveService.getAllTasks();

      if(_tasks.isEmpty){
        _taskDataState = TaskDataState.empty;
      }else{
        _taskDataState = TaskDataState.loaded;
      }

      notifyListeners();

    }catch(e){
       log("Failed to fetch tasks $e");
       _taskDataState = TaskDataState.error;
       notifyListeners();
    }
  }



  void saveTask(Task task) async{
     await _hiveService.addTask(task);
    fetchTasks();
    notifyListeners();
  }

  void updateTask(Task updatedTask, dynamic key) async{
      await _hiveService.updateTask(updatedTask, key);
      fetchTasks();
      notifyListeners();
    
  }

  void deleteTask(Task task) async{
    await _hiveService.deleteTask(task);
    fetchTasks();
    log("Task deleted");
    notifyListeners();
  }

  void softDeleteTask(Task task, bool isDeleted) async{
     await _hiveService.softDeleteTask(task, isDeleted);
     fetchTasks();
     notifyListeners();
  }

  Future<List<Task>> getCompletedTasks() async{
      final tasksCompleted = await _hiveService.getCompletedTasks();
      _tasks = tasksCompleted;
      return _tasks;
  }
  

  void markTask(Task task, bool isCompleted) async{
    await _hiveService.markTask(task, isCompleted);
    fetchTasks();
    notifyListeners();
  }

  void clearTasks() {
    _tasks.clear();
    notifyListeners();
  }
}
