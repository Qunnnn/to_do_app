import 'package:todo_app/feature/todo/data/datasource/local/local_storage.dart';
import 'package:todo_app/feature/todo/domain/entities/task_entity.dart';
import 'package:todo_app/feature/todo/domain/repositories/repo.dart';
import '../model/task_model.dart';

class TaskRepoIml implements TaskRepo {
  LocalStorage localStorage;
  TaskRepoIml({required this.localStorage});
  @override
  Future<List<TaskEntity>> getAllTasks() async {
    return await localStorage.query();
  }

  @override
  Future<int> insertTask(TaskModel? task) async {
    return await localStorage.insert(task);
  }

  @override
  Future<int> deleteTask(TaskModel? task) async {
    return await localStorage.delete(task);
  }

  @override
  Future<int> updateState(int id) async {
    return await localStorage.updateState(id);
  }

  @override
  Future<int> editTask(int id, String title, String note) async {
    return await localStorage.editTask(id, title, note);
  }
}
