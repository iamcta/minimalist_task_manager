import 'package:flutter/material.dart';
import '../../widgets/task_list.dart';
import '../../widgets/add_task_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _tasks = [];

  void _addTask(String taskName) {
    setState(() {
      _tasks.add({'name': taskName, 'isCompleted': false});
    });
  }

  void _toggleTask(int index) {
    setState(() {
      _tasks[index]['isCompleted'] = !_tasks[index]['isCompleted'];
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minimalist Task Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AddTaskForm(onAddTask: _addTask),
            Expanded(
              child: TaskList(
                tasks: _tasks,
                toggleTask: _toggleTask,
                deleteTask: _deleteTask, // Pass delete function
              ),
            ),
          ],
        ),
      ),
    );
  }
}
