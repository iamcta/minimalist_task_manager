import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/task_list.dart';
import '../widgets/add_task_form.dart';
import '../providers/task_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Optionally, you could access tasks here if you want to display a summary:
    // final tasksCount = context.watch<TaskProvider>().tasks.length;
 
    
  return Scaffold(
      appBar: AppBar(
        title: const Text('Minimalist Task Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
  children: [
    AddTaskForm(
      onAddTask: (String taskName) {
        // Use the provider to add a task
        context.read<TaskProvider>().addTask(taskName);
      },
    ),
    Expanded(
      child: TaskList(),
    ),
  ],
),
      ),
    );
  }
}