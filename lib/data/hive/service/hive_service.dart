

import 'package:hive/hive.dart';

import '../../constants/constants.dart';
import '../../models/category.dart';
import '../../models/task.dart';

class HiveService {

  late Box<Task> _taskBox;
  late Box<Category> _categoryBox;

  // Open boxes
  Future init() async {
    _taskBox = await Hive.openBox<Task>('tasks');
    _categoryBox = await Hive.openBox<Category>('categories'); 
  }

  // Add methods
  void addTask(Task task) => _taskBox.add(task);
  void addCategory(Category category) => _categoryBox.add(category);

  // Get methods  
  Task? getTask(String id) => _taskBox.get(id);
  Category? getCategory(String id) => _categoryBox.get(id);

  // Update methods
  void updateTask(Task task) => _taskBox.put(task.id, task);
  void updateCategory(Category category) => _categoryBox.put(category.id, category);

  // Delete methods
  void deleteTask(String id) => _taskBox.delete(id);
  void deleteCategory(String id) => _categoryBox.delete(id);

  // Query methods
  List<Task> getAllTasks() => _taskBox.values.toList();
  List<Category> getAllCategories() => _categoryBox.values.toList();

  // Other methods for the task
  List<Task> getTasksByStatus(TaskStatus status) {
  return _taskBox.values.where((task) => task.status == status).toList();
}

List<Task> getTasksOverdue() {
  return _taskBox.values.where((task) {
    return task.dueDate.isBefore(DateTime.now()); 
  }).toList();
}

List<Task> getTasksDueToday() {
  return _taskBox.values.where((task) {
    return task.dueDate.day == DateTime.now().day;
  }).toList();
}

List<Task> getTasksByCategory(String categoryId) {
  return _taskBox.values.where((task) => task.category.id == categoryId).toList();
}

  // Other query methods for the category

  List<Category> getCategoriesByName(String name) {
  return _categoryBox.values.where((cat) => cat.name == name).toList();
}

int getCategoryCount() {
  return _categoryBox.values.length;
}

  // Close boxes
  void close() {
    _taskBox.close();
    _categoryBox.close();
  }

}