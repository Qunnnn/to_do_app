import 'package:todo_app/feature/todo/data/datasource/network_manager.dart';
import 'package:todo_app/feature/todo/domain/entities/task_entity.dart';
import 'package:todo_app/feature/todo/domain/repositories/repo.dart';
import '../model/task_model.dart';

class TaskRepoIml implements TaskRepo {
  NetWorkManager netWorkManager;
  TaskRepoIml({required this.netWorkManager});
  @override
  Future<List<TaskEntity>> getAllTasks() async {
    return await netWorkManager.query();
  }

  @override
  Future<int> insertTask(TaskModel? task) async {
    return await netWorkManager.insert(task);
  }

  @override
  Future<int> deleteTask(TaskModel? task) async {
    return await netWorkManager.delete(task);
  }

  @override
  Future<int> updateState(int id) async {
    return await netWorkManager.updateState(id);
  }

  @override
  Future<int> editTask(int id, String title, String note) async {
    return await netWorkManager.editTask(id, title, note);
  }
}
