abstract class ThemeRepo {
    Future<void> writeStatusThemeMode(
      {required String key, required bool status});
  Future<bool?> readStatusThemeMode({required String key});
}