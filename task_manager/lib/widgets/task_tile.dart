import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  TaskTile({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text(task.description),
      trailing: Checkbox(
        value: task.isCompleted,
        onChanged: (bool? value) {
          final updatedTask = Task(
              id: task.id,
              title: task.title,
              description: task.description,
              isCompleted: value!);
          Provider.of<TaskProvider>(context, listen: false)
              .updateTask(updatedTask);
        },
      ),
      onLongPress: () {
        Provider.of<TaskProvider>(context, listen: false).deleteTask(task.id);
      },
    );
  }
}
