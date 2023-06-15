import 'package:flutter/material.dart';
import '../../../../constant/constant.dart';

class ModalSheetButton extends StatelessWidget {
  final String label;
  final bool? isClose;
  final Function()? onTap;
  final Color? clr;
  const ModalSheetButton(
      {super.key, required this.label, this.isClose, this.onTap, this.clr});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.06,
        width: size.width * 0.8,
        decoration: BoxDecoration(
            color: clr,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: isClose == true ? AppColors.redColor : Colors.grey)),
        child: Center(
          child: Text(
            label,
            style: AppTextStyle.contentStyle,
          ),
        ),
      ),
    );
  }
}