import 'package:flutter/material.dart';
import 'package:test_project/style/app_typography.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get appTheme {
    return ThemeData(
      textTheme: AppTypography.textTheme,
    );
  }
}
