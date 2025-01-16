import 'package:flutter/material.dart';
import '../../utils/global_styles.dart';

class AddTaskForm extends StatelessWidget {
  final Function(String taskName) onAddTask;

  AddTaskForm({super.key, required this.onAddTask});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: GlobalStyles.globalPadding,
      decoration: GlobalStyles.cardDecoration,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Enter task name'),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              final taskName = _controller.text.trim();
              if (taskName.isNotEmpty) {
                onAddTask(taskName);
                _controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}