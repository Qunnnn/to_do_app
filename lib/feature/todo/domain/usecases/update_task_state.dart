import '../repositories/repo.dart';

class UpdateState {
  TaskRepo taskRepo;
  UpdateState({required this.taskRepo});
    Future<int> execute(int id) {
    return taskRepo.updateState(id);
  }
}
