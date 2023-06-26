import 'package:flutter/material.dart';
import 'package:todo_app/feature/todo/data/model/task_model.dart';
import 'package:todo_app/feature/todo/domain/entities/task_entity.dart';
import 'package:todo_app/feature/todo/domain/usecases/usecases.dart';

class TaskProvider extends ChangeNotifier {
  InsertTask insertTask;
  GetAllTasks getAllTasks;
  DeleteTask deleteTask;
  UpdateState updateState;
  EditTask edit;
  TaskProvider(
      {required this.insertTask,
      required this.getAllTasks,
      required this.deleteTask,
      required this.updateState,
      required this.edit});

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

  Future<int> updateTaskState(int id) async {
    return await updateState.execute(id);
  }

  Future<int> editTask(int id, String title, String note) async {
    return await edit.execute(id, title, note);
  }
}
