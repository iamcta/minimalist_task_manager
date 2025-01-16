import 'package:flutter/material.dart';
import 'task_item.dart';

class TaskList extends StatelessWidget {
  final List<Map<String, dynamic>> tasks;

  TaskList({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskItem(
          taskName: tasks[index]['name'],
          isCompleted: tasks[index]['isCompleted'],
        );
      },
    );
  }
}