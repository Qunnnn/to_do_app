import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../constant/constant.dart';
import '../provider/theme_service.dart';
import '../screens/add_task_page.dart';
import 'build_button.dart';

class BuildTaskBar extends StatelessWidget {
  final ThemeService themeMode;
  const BuildTaskBar({
    super.key,
    required this.themeMode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()).toString(),
                style: AppTextStyle.subHeadingStyle.copyWith(
                    color:
                        themeMode.themeStatus ? Colors.grey[400] : Colors.grey),
              ),
              const Text(
                'Today',
                style: AppTextStyle.headingStyle,
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            customBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddTaskPage(),
                  ));
            },
            child: MyButton(
              themeMode: themeMode,
              title: '+ Add Task',
            ),
          ),
        ],
      ),
    );
  }
}
