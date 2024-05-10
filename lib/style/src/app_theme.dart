part of '../style.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get appTheme {
    return ThemeData(
      textTheme: AppTypography.textTheme,
      scaffoldBackgroundColor: Palette.kClrWhite,
      brightness: Brightness.light,
      elevatedButtonTheme: AppButton.elevatedBtnThemeData,
      outlinedButtonTheme: AppButton.outlinedBtnThemeData,
    );
  }
}
