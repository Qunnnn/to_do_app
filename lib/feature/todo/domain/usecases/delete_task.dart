import '../../data/model/task_model.dart';
import '../repositories/repo.dart';

class DeleteTask {
  TaskRepo taskRepo;
  DeleteTask({required this.taskRepo});

  Future<int> execute(TaskModel? task) {
    return taskRepo.deleteTask(task);
  }
}
