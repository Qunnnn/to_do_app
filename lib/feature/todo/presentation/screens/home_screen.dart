import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/feature/todo/presentation/presentation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeService>();
    return Scaffold(
      appBar: BuildAppBar(themeMode: themeMode),
      body: Column(
        children: [
          BuildTaskBar(themeMode: themeMode),
          const ShowTask(),
        ],
      ),
    );
  }
}
