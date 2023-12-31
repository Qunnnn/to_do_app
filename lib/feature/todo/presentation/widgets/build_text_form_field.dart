import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/layout/app_layout.dart';
import '../../../../constant/constant.dart';
import '../provider/theme_service.dart';

class MyTextFormFiled extends StatelessWidget {
  final String subTitle;
  final String hint;
  final Widget? widget;
  final TextEditingController? controller;
  final bool? expand;
  final int? maxLines;
  const MyTextFormFiled(
      {super.key,
      this.maxLines,
      required this.subTitle,
      required this.hint,
      this.controller,
      this.widget,
      this.expand});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeService>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subTitle,
          style: AppTextStyle.subHeadingStyle,
        ),
        SizedBox(
          height: AppLayout.getHeight(context: context, pixel: 5),
        ),
        Container(
          height: AppLayout.getHeight(context: context, pixel: 45),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
                readOnly: widget == null ? false : true,
                expands: expand ?? false,
                maxLines: maxLines,
                cursorColor:
                    themeMode.themeStatus ? Colors.white : Colors.black,
                cursorHeight: AppLayout.getHeight(context: context, pixel: 25),
                controller: controller,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: AppTextStyle.subHeadingStyle.copyWith(
                      color: themeMode.themeStatus ? Colors.white : Colors.grey,
                      fontSize:
                          AppLayout.getHeight(context: context, pixel: 15)),
                  contentPadding: expand == true
                      ? EdgeInsets.only(
                          left: AppLayout.getWidth(context: context, pixel: 10),
                          top: AppLayout.getHeight(context: context, pixel: 8))
                      : EdgeInsets.only(
                          left: AppLayout.getWidth(context: context, pixel: 10),
                          bottom:
                              AppLayout.getHeight(context: context, pixel: 10)),
                  border: InputBorder.none,
                ),
              )),
              widget == null ? Container() : widget!
            ],
          ),
        ),
      ],
    );
  }
}
