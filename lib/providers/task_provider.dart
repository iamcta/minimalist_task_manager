import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  // The internal list of tasks. Each task is a Map with 'name' and 'isCompleted'.
  final List<Map<String, dynamic>> _tasks = [];

  // Provide a public, read-only view of the tasks.
  List<Map<String, dynamic>> get tasks => List.unmodifiable(_tasks);

  // Add a new task to the list and notify listeners for UI updates.
  void addTask(String taskName) {
    _tasks.add({
      'name': taskName,
      'isCompleted': false,
    });
    notifyListeners();
  }

  // Toggle the 'isCompleted' field for a specific task.
  void toggleTask(int index) {
    _tasks[index]['isCompleted'] = !_tasks[index]['isCompleted'];
    notifyListeners();
  }

void reorderTask(int oldIndex, int newIndex) {
  if (newIndex > oldIndex) {
    newIndex--;
  }
  final item = _tasks.removeAt(oldIndex);
  _tasks.insert(newIndex, item);
  notifyListeners();
}

  // Delete a task from the list.
  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}