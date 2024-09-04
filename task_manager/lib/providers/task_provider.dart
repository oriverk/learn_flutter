import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/database_service.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> fetchTasks() async {
    _tasks = await DatabaseService().getTasks();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await DatabaseService().insertTask(task);
    fetchTasks();
  }

  Future<void> updateTask(Task task) async {
    await DatabaseService().updateTask(task);
    fetchTasks();
  }

  Future<void> deleteTask(int id) async {
    await DatabaseService().deleteTask(id);
    fetchTasks();
  }
}
