import 'package:flutter/material.dart';
import 'package:stan_handel_web/presentation/style/app_colors.dart';
import 'package:stan_handel_web/presentation/style/app_typography.dart';

class AppThemes {
  const AppThemes._();

  static final lightStyle = ThemeData(
    primaryColor: AppColors.primary,
    fontFamily: AppTypography.fontFamily,
    scrollbarTheme: const ScrollbarThemeData(
      trackColor: MaterialStatePropertyAll(Colors.white),
      thumbColor: MaterialStatePropertyAll(AppColors.gray5),
      thickness: MaterialStatePropertyAll(8)
    ),
  );
}
