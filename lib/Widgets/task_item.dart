import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class TaskItem extends StatelessWidget {
  final int index;

  const TaskItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // Access your provider and its tasks list
    final taskProvider = context.watch<TaskProvider>();
    final task = taskProvider.tasks[index];

    final String taskName = task['name'];
    final bool isCompleted = task['isCompleted'];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Task name with optional strikethrough
          Text(
            taskName,
            style: TextStyle(
              fontSize: 16.0,
              decoration: isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
          Row(
            children: [
              // Toggling the checkbox
              Checkbox(
                value: isCompleted,
                onChanged: (value) {
                  // Toggle completion status via Provider
                  context.read<TaskProvider>().toggleTask(index);
                },
              ),
              // Deleting the task
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  context.read<TaskProvider>().deleteTask(index);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}