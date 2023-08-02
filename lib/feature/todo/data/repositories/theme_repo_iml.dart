import 'package:todo_app/feature/todo/domain/repositories/theme_repo.dart';
import '../datasource/network_manager.dart';

class ThemeRepoIml implements ThemeRepo {
  NetWorkManager netWorkManager;
  ThemeRepoIml({required this.netWorkManager});
  @override
  Future<bool?> readStatusThemeMode({required String key}) async {
    return await netWorkManager.readStatusThemeMode(key: key);
  }

  @override
  Future<void> writeStatusThemeMode(
      {required String key, required bool status}) async {
    await netWorkManager.writeStatusThemeMode(key: key, status: status);
  }
}
