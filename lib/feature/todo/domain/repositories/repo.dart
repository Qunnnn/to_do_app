import 'package:todo_app/feature/todo/data/model/task_model.dart';
import 'package:todo_app/feature/todo/domain/entities/task_entity.dart';

abstract class TaskRepo {
  Future<List<TaskEntity>> getAllTasks();
  Future<int> insertTask(TaskModel? task);
  Future<int> deleteTask(TaskModel? task);
  Future<int> updateTask(int id);

}
