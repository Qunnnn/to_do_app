import 'package:todo_app/feature/todo/domain/repositories/theme_repo.dart';

class WriteStatusThemeMode {
  ThemeRepo themeRepo;
  WriteStatusThemeMode({required this.themeRepo});

  Future<void> execute({required String key, required bool status}) async {
    await themeRepo.writeStatusThemeMode(key: key, status: status);
  }
}
