import 'package:flutter/material.dart';
import 'package:graduation_project/AddTasksScreen/model/model_database_helper.dart';

class TasksProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _tasks = [];
  Set<int> _selectedTasks = {};

  List<Map<String, dynamic>> get tasks => _tasks;
  Set<int> get selectedTasks => _selectedTasks;

  TasksProvider() {
    loadTasks();
  }

  Future<void> loadTasks() async {
    _tasks = await DatabaseHelper.instance.getTasks();
    notifyListeners();
  }

  Future<void> addTask(String title) async {
    if (title.isNotEmpty) {
      await DatabaseHelper.instance.addTask(title);
      loadTasks();
    }
  }

  Future<void> deleteTask(int id) async {
    await DatabaseHelper.instance.deleteTask(id);
    _selectedTasks.remove(id);
    loadTasks();
  }

  Future<void> deleteSelectedTasks() async {
    for (var id in _selectedTasks) {
      await DatabaseHelper.instance.deleteTask(id);
    }
    _selectedTasks.clear();
    loadTasks();
  }

  Future<void> deleteAllTasks() async {
    for (var task in _tasks) {
      await DatabaseHelper.instance.deleteTask(task['id']);
    }
    _selectedTasks.clear();
    loadTasks();
  }

  void toggleSelection(int id) {
    if (_selectedTasks.contains(id)) {
      _selectedTasks.remove(id);
    } else {
      _selectedTasks.add(id);
    }
    notifyListeners();
  }

  void selectAll() {
    if (_selectedTasks.length == _tasks.length) {
      _selectedTasks.clear();
    } else {
      _selectedTasks = _tasks.map((task) => task['id'] as int).toSet();
    }
    notifyListeners();
  }
}
