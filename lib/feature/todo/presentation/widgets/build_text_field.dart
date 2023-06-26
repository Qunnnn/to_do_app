import 'package:flutter/material.dart';
import 'package:todo_app/constant/app_textStyle.dart';
import 'package:todo_app/core/layout/app_layout.dart';

class TextFieldWidget extends StatefulWidget {
  final int? maxLines;
  final String label;
  final String text;
  final TextEditingController controller;
  const TextFieldWidget(
      {Key? key,
      this.maxLines,
      required this.label,
      required this.text,
      required this.controller})
      : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: AppTextStyle.contentStyle,
          ),
          SizedBox(height: AppLayout.getHeight(context: context, pixel: 8)),
          TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            maxLines: widget.maxLines,
          ),
        ],
      );
}
