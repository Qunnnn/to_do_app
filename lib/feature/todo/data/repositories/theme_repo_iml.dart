import 'package:todo_app/feature/todo/domain/repositories/theme_repo.dart';
import '../datasource/local/local_storage.dart';

class ThemeRepoIml implements ThemeRepo {
  LocalStorage localStorage;
  ThemeRepoIml({required this.localStorage});
  @override
  Future<bool?> readStatusThemeMode({required String key}) async {
    return await localStorage.readStatusThemeMode(key: key);
  }

  @override
  Future<void> writeStatusThemeMode(
      {required String key, required bool status}) async {
    await localStorage.writeStatusThemeMode(key: key, status: status);
  }
}
