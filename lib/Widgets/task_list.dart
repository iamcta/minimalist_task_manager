import 'package:flutter/material.dart';
import 'task_item.dart';

class TaskList extends StatelessWidget {
  final List<Map<String, dynamic>> tasks;
  final Function(int) toggleTask;
  final Function(int) deleteTask; // Add deleteTask callback

  const TaskList({
    super.key,
    required this.tasks,
    required this.toggleTask,
    required this.deleteTask, // Add to constructor
  });
@override
Widget build(BuildContext context) {
  return ReorderableListView(
    onReorder: (oldIndex, newIndex) {
      if (newIndex > oldIndex) {
        newIndex--;
      }
      final item = tasks.removeAt(oldIndex);
      tasks.insert(newIndex, item);
    },
    children: [
      for (int index = 0; index < tasks.length; index++)
        ListTile(
          key: ValueKey(tasks[index]),
          title: TaskItem(
            taskName: tasks[index]['name'],
            isCompleted: tasks[index]['isCompleted'],
            onToggle: () => toggleTask(index),
            onDelete: () => deleteTask(index),
          ),
        ),
    ],
  );
}
}