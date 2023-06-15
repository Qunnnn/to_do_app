import 'package:todo_app/feature/todo/domain/entities/task_entity.dart';
import 'package:todo_app/feature/todo/domain/repositories/repo.dart';

class GetAllTasks {
  TaskRepo taskRepo;
  GetAllTasks({required this.taskRepo});

  Future<List<TaskEntity>> execute() {
   return taskRepo.getAllTasks();
  }
}
