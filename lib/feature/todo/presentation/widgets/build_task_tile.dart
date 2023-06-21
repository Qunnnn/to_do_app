import 'package:flutter/material.dart';
import 'package:todo_app/core/layout/app_layout.dart';
import '../../../../constant/constant.dart';
import '../../domain/entities/task_entity.dart';
import '../provider/theme_service.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.size,
    required this.task,
    required this.themeMode,
  });

  final Size size;
  final TaskEntity task;
  final ThemeService themeMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: AppLayout.getHeight(context: context, pixel: 10),
          right: AppLayout.getWidth(context: context, pixel: 10),
          left: AppLayout.getWidth(context: context, pixel: 10)),
      padding: const EdgeInsets.all(7),
      height: size.height * 0.13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: task.color == 0
            ? AppColors.blueAccentColor
            : task.color == 1
                ? AppColors.redColor
                : AppColors.yellowColor,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  task.title!,
                  style: AppTextStyle.contentStyle,
                ),
                SizedBox(
                  height: AppLayout.getHeight(context: context, pixel: 7),
                ),
                Text(
                  task.note!,
                  style: AppTextStyle.contentStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: AppLayout.getHeight(context: context, pixel: 7),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_outlined,
                    ),
                    SizedBox(
                      width: AppLayout.getWidth(context: context, pixel: 5),
                    ),
                    Text(
                      task.startTime!,
                      style: AppTextStyle.contentStyle,
                    ),
                    const Text(
                      '-',
                      style: AppTextStyle.contentStyle,
                    ),
                    Text(
                      task.endTime!,
                      style: AppTextStyle.contentStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 1,
            child: Container(
              height: double.infinity,
              margin: EdgeInsets.only(
                right: AppLayout.getWidth(context: context, pixel: 5),
                top: AppLayout.getHeight(context: context, pixel: 5),
                bottom: AppLayout.getHeight(context: context, pixel: 5),
              ),
              width: 30,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color:
                          themeMode.themeStatus ? Colors.white : Colors.black),
                ),
                color: Colors.transparent,
              ),
              child: Center(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    task.isCompleted == 0 ? 'Todo' : 'Completed',
                    style: AppTextStyle.contentStyle,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
