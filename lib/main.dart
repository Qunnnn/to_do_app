import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/appProvider/app_global_providers.dart';
import 'package:todo_app/feature/todo/data/datasource/network_manager.dart';
import 'constant/theme.dart';
import 'feature/todo/presentation/presentation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NetWorkManager.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppGlobalProviders.globalProviders,
      builder: (context, child) {
        final themeMode = Provider.of<ThemeService>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          themeMode: themeMode.themeStatus ? ThemeMode.dark : ThemeMode.light,
          home: const HomePage(),
        );
      },
    );
  }
}
