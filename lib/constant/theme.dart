import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constant/app_colors.dart';

class Themes {
  static final darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.darkAppbarClr),
      scaffoldBackgroundColor: AppColors.darkScfBgClr,
      useMaterial3: true,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      textTheme: GoogleFonts.acmeTextTheme(
          ThemeData(brightness: Brightness.dark).textTheme));
  static final lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.lightAppbarClr),
      scaffoldBackgroundColor: AppColors.lightScfBgClr,
      useMaterial3: true,
      iconTheme: const IconThemeData(color: Colors.black),
      textTheme: GoogleFonts.acmeTextTheme(
          ThemeData(brightness: Brightness.light).textTheme));
}
