import 'package:flutter/material.dart';
import '../../../../constant/constant.dart';
import '../provider/theme_service.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.themeMode,
    required this.title
  });
  final String title;
  final ThemeService themeMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: themeMode.themeStatus ? Colors.indigo : Colors.teal,
      ),
      child:  Center(
        child: Text(
         title,
          style: AppTextStyle.contentStyle,
        ),
      ),
    );
  }
}
