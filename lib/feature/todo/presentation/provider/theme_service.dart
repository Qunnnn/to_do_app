import 'package:flutter/material.dart';
import 'package:todo_app/feature/todo/domain/domain.dart';

class ThemeService extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  ReadStatusThemeMode readStatusThemeMode;
  WriteStatusThemeMode writeStatusThemeMode;
  bool themeStatus = false;
  ThemeService(
      {required this.readStatusThemeMode, required this.writeStatusThemeMode});
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) async {
    themeMode = isOn ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
    await writeStatusThemeMode.execute(
        key: 'theme', status: themeMode == ThemeMode.dark ? true : false);
  }

  void getThemeStatus() async {
    themeStatus = await readStatusThemeMode.execute(key: 'theme') ?? false;
    notifyListeners();
  }
}
