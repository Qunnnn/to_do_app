import 'package:todo_app/feature/todo/domain/repositories/theme_repo.dart';
import '../datasource/db_helper.dart';

class ThemeRepoIml implements ThemeRepo {
  DbHelper dbHelper;
  ThemeRepoIml({required this.dbHelper});
  @override
  Future<bool?> readStatusThemeMode({required String key}) async {
    return await dbHelper.readStatusThemeMode(key: key);
  }

  @override
  Future<void> writeStatusThemeMode(
      {required String key, required bool status}) async {
    await dbHelper.writeStatusThemeMode(key: key, status: status);
  }
}
