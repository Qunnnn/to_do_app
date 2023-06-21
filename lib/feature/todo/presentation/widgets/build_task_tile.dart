import 'package:flutter/material.dart';
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
      margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                task.title!,
                style: AppTextStyle.contentStyle,
              ),
              Text(
                task.note!,
                style: AppTextStyle.contentStyle,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.access_time_outlined,
                  ),
                  const SizedBox(
                    width: 5,
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
          const Spacer(),
          Container(
            height: double.infinity,
            margin: const EdgeInsets.only(right: 5, top: 5, bottom: 5),
            width: 30,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                    color: themeMode.themeStatus ? Colors.white : Colors.black),
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
          )
        ],
      ),
    );
  }
}
