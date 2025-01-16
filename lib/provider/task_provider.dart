import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _tasks = [];

  List<Map<String, dynamic>> get tasks => _tasks;

  void addTask(String taskName) {
    _tasks.add({'name': taskName, 'isCompleted': false});
    notifyListeners();
  }

  void toggleTask(int index) {
    _tasks[index]['isCompleted'] = !_tasks[index]['isCompleted'];
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
