import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import 'task_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    // Watch for changes to the TaskProvider
    final taskProvider = context.watch<TaskProvider>();
    // Get the list of tasks from the provider
    final tasks = taskProvider.tasks;

    return ReorderableListView(
      onReorder: (oldIndex, newIndex) {
        // Call the provider method to handle reordering the list
        context.read<TaskProvider>().reorderTask(oldIndex, newIndex);
      },
      // Build each list item with a key and a TaskItem
      children: [
        for (int i = 0; i < tasks.length; i++)
          ListTile(
            key: ValueKey(tasks[i]),  // A key helps Flutter track each item
            title: TaskItem(index: i), 
          ),
      ],
    );
  }
}