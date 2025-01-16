import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskProvider extends ChangeNotifier {
  // Internal list of tasks, each a Map with 'name' and 'isCompleted'.
  final List<Map<String, dynamic>> _tasks = [];

  // Key to identify where in SharedPreferences this data is stored.
  static const String _tasksKey = 'my_tasks_key';

  // Provide a read-only view of the tasks.
  List<Map<String, dynamic>> get tasks => List.unmodifiable(_tasks);

  // Constructor: load tasks as soon as the provider is created.
  TaskProvider() {
    _loadTasks();
  }

  // Add a new task, notify listeners, and save to shared prefs.
  void addTask(String taskName) {
    _tasks.add({
      'name': taskName,
      'isCompleted': false,
    });
    notifyListeners();
    _saveTasks();
  }

  // Toggle the 'isCompleted' field for a specific task.
  void toggleTask(int index) {
    _tasks[index]['isCompleted'] = !_tasks[index]['isCompleted'];
    notifyListeners();
    _saveTasks();
  }

  // Reorder tasks, then save.
  void reorderTask(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex--;
    }
    final item = _tasks.removeAt(oldIndex);
    _tasks.insert(newIndex, item);
    notifyListeners();
    _saveTasks();
  }

  // Delete a task, then save.
  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
    _saveTasks();
  }

  // ------------------------- Persistence Methods -------------------------

  // Load tasks from SharedPreferences at startup.
  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksJson = prefs.getString(_tasksKey);

    if (tasksJson != null) {
      final List decoded = jsonDecode(tasksJson) as List;
      // Convert each item back to Map<String, dynamic>
      _tasks.clear();
      for (var item in decoded) {
        _tasks.add({
          'name': item['name'],
          'isCompleted': item['isCompleted'],
        });
      }
      notifyListeners();
    }
  }

  // Save current tasks list to SharedPreferences.
  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String encoded = jsonEncode(_tasks);
    await prefs.setString(_tasksKey, encoded);
  }
}