import 'package:flutter/material.dart';
import 'package:todo_app/feature/todo/data/model/task_model.dart';
import 'package:todo_app/feature/todo/domain/entities/task_entity.dart';
import 'package:todo_app/feature/todo/domain/usecases/usecases.dart';

class TaskProvider extends ChangeNotifier {
  InsertTask insertTask;
  GetAllTasks getAllTasks;
  DeleteTask deleteTask;
  UpdateTask updateTask;
  TaskProvider(
      {required this.insertTask,
      required this.getAllTasks,
      required this.deleteTask , required this.updateTask});

  List<TaskEntity> list = [];

  Future<int> insert({TaskModel? task}) async {
    return await insertTask.execute(task);
  }

  Future<void> getTasks() async {
    list = await getAllTasks.execute();
    notifyListeners();
  }

  Future<int> delete(TaskModel? task) async {
    return await deleteTask.execute(task);
  }

  Future<int> update(int id) async {
    return await updateTask.execute(id);
  }
}
