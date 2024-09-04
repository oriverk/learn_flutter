import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text;
                final description = descriptionController.text;
                final newTask = Task(
                    id: DateTime.now().millisecondsSinceEpoch,
                    title: title,
                    description: description);
                Provider.of<TaskProvider>(context, listen: false)
                    .addTask(newTask);
                Navigator.pop(context);
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
