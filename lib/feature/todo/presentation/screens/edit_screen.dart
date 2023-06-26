import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/layout/app_layout.dart';
import 'package:todo_app/feature/todo/presentation/widgets/widgets.dart';
import '../../domain/entities/task_entity.dart';
import '../provider/task_provider.dart';
import '../provider/theme_service.dart';

// ignore: must_be_immutable
class EditScreen extends StatefulWidget {
  EditScreen({super.key, required this.task});
  TaskEntity task;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController titleController;
  late TextEditingController noteController;
  late TaskProvider taskProvider;
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      taskProvider = Provider.of<TaskProvider>(context, listen: false);
      taskProvider.getTasks();
    });
    titleController = TextEditingController(text: widget.task.title);
    noteController = TextEditingController(text: widget.task.note);
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = context.read<ThemeService>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: AppLayout.getWidth(context: context, pixel: 10),
            vertical: AppLayout.getHeight(context: context, pixel: 10)),
        children: [
          SizedBox(
            height: AppLayout.getHeight(context: context, pixel: 5),
          ),
          TextFieldWidget(
            label: 'Title',
            text: widget.task.title!,
            controller: titleController,
          ),
          SizedBox(
            height: AppLayout.getHeight(context: context, pixel: 5),
          ),
          TextFieldWidget(
            label: 'Note',
            text: widget.task.title!,
            controller: noteController,
          ),
          SizedBox(
            height: AppLayout.getHeight(context: context, pixel: 20),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppLayout.getWidth(context: context, pixel: 120)),
            child: GestureDetector(
                onTap: () {
                  Provider.of<TaskProvider>(context, listen: false).editTask(
                      widget.task.id!,
                      titleController.text,
                      noteController.text);
                  Provider.of<TaskProvider>(context, listen: false).getTasks();
                  Navigator.pop(context);
                },
                child: MyButton(themeMode: themeMode, title: 'Save')),
          ),
        ],
      ),
    );
  }
}
