import '../../data/model/task_model.dart';
import '../repositories/repo.dart';

class InsertTask {
  TaskRepo taskRepo;
  InsertTask({required this.taskRepo});
  
  Future<int> execute(TaskModel? task) {
    return taskRepo.insertTask(task);
  }
}
