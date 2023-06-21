import 'package:flutter/material.dart';
import 'package:todo_app/core/layout/app_layout.dart';
import '../provider/theme_service.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ThemeService themeMode;
  const BuildAppBar({
    super.key,
    required this.themeMode,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
          onTap: () {
            themeMode.toggleTheme(themeMode.isDarkMode);
          },
          child: Icon(
            themeMode.themeStatus
                ? Icons.nightlight_round_outlined
                : Icons.wb_sunny_outlined,
            color: Theme.of(context).iconTheme.color,
          )),
      actions: [
        Padding(
          padding: EdgeInsets.only(
              right: AppLayout.getWidth(context: context, pixel: 20)),
          child: Icon(
            Icons.person,
            color: Theme.of(context).iconTheme.color,
            size: AppLayout.getHeight(context: context, pixel: 25),
          ),
        ),
      ],
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 50);
}
