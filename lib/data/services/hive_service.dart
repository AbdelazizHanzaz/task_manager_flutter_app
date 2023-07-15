import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../models/task_model.dart';

class HiveService {
  static const String _taskBoxName = 'tasks';

  Future<void> initHive() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(TaskAdapter());
  }

  Future<Box<Task>> openTaskBox() async {
    return await Hive.openBox<Task>(_taskBoxName);
  }

  Future<int> addTask(Task task) async {
    final box = await openTaskBox();
    return await box.add(task);
  }

  Future<void> updateTask(Task task) async {
    final box = await openTaskBox();
    await box.put(task.key, task);
  }

  Future<void> deleteTask(Task task) async {
    final box = await openTaskBox();
    await box.delete(task.key);
  }

  Future<List<Task>> getAllTasks() async {
    final box = await openTaskBox();
    return box.values.toList();
  }

  //   Future<Task> getTaskById(int taskId) async {
  //   final box = await openTaskBox();
  //   return box.get(taskId);
  // }

  Future<void> markTaskAsCompleted(Task task) async {
    final box = await openTaskBox();
    task.isCompleted = true;
    await box.put(task.key, task);
  }

  Future<void> clearAllTasks() async {
    final box = await openTaskBox();
    await box.clear();
  }

  Future<List<Task>> getCompletedTasks() async {
    final box = await openTaskBox();
    return box.values.where((task) => task.isCompleted).toList();
  }

  Future<List<Task>> getIncompleteTasks() async {
    final box = await openTaskBox();
    return box.values.where((task) => !task.isCompleted).toList();
  }

  Future<List<Task>> getTasksDueToday() async {
    final box = await openTaskBox();
    final now = DateTime.now();
    final todayTasks = box.values
        .where((task) =>
            task.dueDate.year == now.year &&
            task.dueDate.month == now.month &&
            task.dueDate.day == now.day)
        .toList();
    return todayTasks;
  }

  Future<List<Task>> getOverdueTasks() async {
    final box = await openTaskBox();
    final now = DateTime.now();
    final overdueTasks = box.values
        .where((task) => !task.isCompleted && task.dueDate.isBefore(now))
        .toList();
    return overdueTasks;
  }
}
