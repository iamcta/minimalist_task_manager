import 'package:flutter/material.dart';
import '../../utils/global_styles.dart';

class TaskItem extends StatelessWidget {
  final String taskName;
  final bool isCompleted;

  TaskItem({required this.taskName, this.isCompleted = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: GlobalStyles.globalPadding,
      decoration: GlobalStyles.cardDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            taskName,
            style: GlobalStyles.bodyStyle.copyWith(
              decoration: isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
          Checkbox(
            value: isCompleted,
            onChanged: (value) {
              //checkbox toggle
            },
          ),
            
          
        ],
      )
    );
  }
}