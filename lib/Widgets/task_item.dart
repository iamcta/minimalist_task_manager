import 'package:flutter/material.dart';
import '../../utils/global_styles.dart';
class TaskItem extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TaskItem({
    super.key,
    required this.taskName,
    required this.onToggle,
    required this.onDelete,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
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
          Text(
            taskName,
            style: TextStyle(
              fontSize: 16.0,
              decoration: isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: isCompleted,
                onChanged: (value) {
                  onToggle();
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: onDelete, // Call the delete callback
              ),
            ],
          ),
        ],
      ),
    );
  }
}
