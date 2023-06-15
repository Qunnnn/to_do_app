import '../repositories/repo.dart';

class UpdateTask {
  TaskRepo taskRepo;
  UpdateTask({required this.taskRepo});
    Future<int> execute(int id) {
    return taskRepo.updateTask(id);
  }
}
