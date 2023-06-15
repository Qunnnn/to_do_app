import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/appProvider/app_global_providers.dart';
import 'package:todo_app/feature/todo/data/datasource/db_helper.dart';
import 'package:todo_app/feature/todo/presentation/provider/provider.dart';
import 'constant/theme.dart';
import 'feature/todo/presentation/screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppGlobalProviders.globalProviders,
      builder: (context, child) {
        final themeModeProvider = Provider.of<ThemeService>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          themeMode: themeModeProvider.themeMode,
          home: const HomePage(),
        );
      },
    );
  }
}
