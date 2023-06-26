import 'package:flutter/material.dart';
import 'package:todo_app/constant/app_textStyle.dart';
import 'package:todo_app/core/layout/app_layout.dart';

class TextWidget extends StatelessWidget {
  final String label;
  final String text;
  const TextWidget({super.key, required this.label, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(context: context, pixel: 10),
          vertical: AppLayout.getHeight(context: context, pixel: 5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyle.headingStyle,
          ),
          Text(
            text,
            style: AppTextStyle.contentStyle,
          ),
        ],
      ),
    );
  }
}
