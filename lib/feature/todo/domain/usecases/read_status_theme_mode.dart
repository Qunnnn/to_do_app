import 'package:todo_app/feature/todo/domain/repositories/theme_repo.dart';

class ReadStatusThemeMode {
  ThemeRepo themeRepo;
  ReadStatusThemeMode({required this.themeRepo});

  Future<bool?> execute({required String key}) async {
    return await themeRepo.readStatusThemeMode(key: key);
  }
}
