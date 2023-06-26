import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constant/constant.dart';
import 'package:todo_app/feature/todo/data/model/task_model.dart';
import 'package:todo_app/feature/todo/domain/entities/task_entity.dart';
import 'package:todo_app/feature/todo/presentation/presentation.dart';
import '../../../../core/layout/app_layout.dart';

class ShowTask extends StatefulWidget {
  const ShowTask({
    super.key,
  });

  @override
  State<ShowTask> createState() => _ShowTaskState();
}

class _ShowTaskState extends State<ShowTask> {
  late TaskProvider taskProvider;
  DateTime selectedDate = DateTime.now();
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
    final task = context.watch<TaskProvider>();
    final themeMode = context.watch<ThemeService>();
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        children: [
          _buildDatePicker(themeMode),
          _showTask(task, size, themeMode),
        ],
      ),
    );
  }

  DatePicker _buildDatePicker(ThemeService themeMode) {
    return DatePicker(
      DateTime.now(),
      height: AppLayout.getHeight(context: context, pixel: 100),
      initialSelectedDate: DateTime.now(),
      selectionColor: themeMode.themeStatus ? Colors.indigo : Colors.teal,
      dateTextStyle: AppTextStyle.contentStyle.copyWith(
        fontSize: AppLayout.getHeight(context: context, pixel: 20),
        color: themeMode.themeStatus ? Colors.white : Colors.black,
      ),
      dayTextStyle: AppTextStyle.contentStyle.copyWith(
        fontSize: AppLayout.getHeight(context: context, pixel: 12),
        color: themeMode.themeStatus ? Colors.white : Colors.black,
      ),
      monthTextStyle: AppTextStyle.contentStyle.copyWith(
        fontSize: AppLayout.getHeight(context: context, pixel: 12),
        color: themeMode.themeStatus ? Colors.white : Colors.black,
      ),
      onDateChange: (date) {
        setState(() {
          selectedDate = date;
        });
      },
    );
  }

  Expanded _showTask(TaskProvider task, Size size, ThemeService themeMode) {
    if (task.list.isEmpty) {
      return Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/to-do-list.png',
            height: size.height * 0.1,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            ' You do not have any tasks yet!\n Add new tasks to make your days productive.',
            textAlign: TextAlign.center,
            style: AppTextStyle.contentStyle,
          ),
        ],
      ));
    }
    return Expanded(
      child: ListView.builder(
        itemCount: task.list.length,
        itemBuilder: (context, index) {
          if (task.list[index].repeat == 'Daily') {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 700),
              child: SlideAnimation(
                child: FadeInAnimation(
                  curve: Curves.easeInToLinear,
                  child: GestureDetector(
                    onTap: () {
                      _showModalBottomSheet(
                          context, task.list[index], size, themeMode, task);
                    },
                    child: TaskTile(
                        size: size,
                        task: task.list[index],
                        themeMode: themeMode),
                  ),
                ),
              ),
            );
          }
          if (task.list[index].date == DateFormat.yMd().format(selectedDate)) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 700),
              child: SlideAnimation(
                child: FadeInAnimation(
                  curve: Curves.easeInToLinear,
                  child: GestureDetector(
                    onTap: () {
                      _showModalBottomSheet(
                          context, task.list[index], size, themeMode, task);
                    },
                    child: TaskTile(
                        size: size,
                        task: task.list[index],
                        themeMode: themeMode),
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Future<dynamic> _showModalBottomSheet(BuildContext context, TaskEntity task,
      Size size, ThemeService themeMode, TaskProvider taskProvider) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height:
              task.isCompleted == 1 ? size.height * 0.26 : size.height * 0.35,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: themeMode.themeStatus
                ? AppColors.darkScfBgClr.withOpacity(0.7)
                : Colors.white,
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5),
                height: size.height * 0.005,
                width: size.width * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: task.isCompleted == 1 ? 10 : 20,
              ),
              task.isCompleted == 1
                  ? Container()
                  : ModalSheetButton(
                      label: 'Task Completed',
                      isClose: false,
                      clr: Colors.red,
                      onTap: () {
                        taskProvider.updateTaskState(task.id!);
                        taskProvider.getTasks();
                        Navigator.pop(context);
                      },
                    ),
              const SizedBox(
                height: 10,
              ),
              ModalSheetButton(
                label: 'Deleted',
                isClose: false,
                clr: AppColors.blueAccentColor,
                onTap: () {
                  taskProvider.delete(task as TaskModel?);
                  taskProvider.getTasks();
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ModalSheetButton(
                label: 'Detail',
                clr: AppColors.lightAppbarClr,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  DetailScreen( id: task.id!,)));
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ModalSheetButton(
                label: 'Close',
                isClose: true,
                clr: Colors.transparent,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        );
      },
    );
  }
}
