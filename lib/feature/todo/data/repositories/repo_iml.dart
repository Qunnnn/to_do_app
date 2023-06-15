import 'package:todo_app/feature/todo/data/datasource/db_helper.dart';
import 'package:todo_app/feature/todo/domain/entities/task_entity.dart';
import 'package:todo_app/feature/todo/domain/repositories/repo.dart';
import '../model/task_model.dart';

class TaskRepoIml implements TaskRepo {
  DbHelper dbHelper;
  TaskRepoIml({required this.dbHelper});
  @override
  Future<List<TaskEntity>> getAllTasks() async {
    return await dbHelper.query();
  }

  @override
  Future<int> insertTask(TaskModel? task) async {
    return await dbHelper.insert(task);
  }

  @override
  Future<int> deleteTask(TaskModel? task) async {
    return await dbHelper.delete(task);
  }
  
  @override
  Future<int> updateTask(int id) async {
    return await dbHelper.update(id); 
  }
}
