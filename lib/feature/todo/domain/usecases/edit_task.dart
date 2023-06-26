import 'package:todo_app/feature/todo/domain/repositories/repo.dart';

class EditTask {
  TaskRepo taskRepo;
  EditTask({required this.taskRepo});
    Future<int> execute(int id, String title, String note) {
    return taskRepo.editTask(id , title , note);
  }
}
