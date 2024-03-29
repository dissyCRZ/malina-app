import 'package:flutter/material.dart';
import '../constants/colors.dart';

const double borderRadius = 16.0;

final mainTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColor.scaffold,
  snackBarTheme: const SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
  ),
  dividerColor: AppColor.darkGrey,
  appBarTheme: const AppBarTheme(
    surfaceTintColor: AppColor.white,
  ),
  fontFamily: 'SFProDisplay',
);
