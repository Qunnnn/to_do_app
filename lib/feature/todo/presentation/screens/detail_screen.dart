import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/layout/app_layout.dart';
import 'package:todo_app/feature/todo/presentation/presentation.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, required this.id});
  int id;
  @override
  State<DetailScreen> createState() => _DetailEditScreenState();
}

class _DetailEditScreenState extends State<DetailScreen> {
  late TaskProvider taskProvider;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      taskProvider = Provider.of<TaskProvider>(context, listen: false);
      taskProvider.getTasks();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final task = context.read<TaskProvider>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(),
        actions: [
          GestureDetector(
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditScreen(
                      task: task.list[widget.id - 1],
                    ),
                  ));
              setState(() {});
            },
            child: Padding(
                padding: EdgeInsets.only(
                    right: AppLayout.getWidth(context: context, pixel: 15)),
                child: Icon(
                  Icons.edit,
                  size: AppLayout.getHeight(context: context, pixel: 20),
                )),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(label: 'Title', text: task.list[widget.id - 1].title!),
          TextWidget(label: 'Note', text: task.list[widget.id - 1].note!),
        ],
      ),
    );
  }
}
