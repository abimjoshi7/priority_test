part of '../style.dart';

class AppTheme {
  const AppTheme._();

  static ColorScheme get colorScheme => ColorScheme(
        brightness: Brightness.light,
        primary: AppPalette.kClrWhite,
        onPrimary: AppPalette.kClrBlack,
        secondary: AppPalette.kClrBlack,
        onSecondary: AppPalette.kClrWhite,
        error: AppPalette.kClrRed,
        onError: AppPalette.kClrWhite,
        background: AppPalette.kClrWhite,
        onBackground: AppPalette.kClrBlack,
        surface: AppPalette.kClrWhite,
        onSurface: AppPalette.kClrBlack,
        primaryContainer: AppPalette.kClrPaleGrey,
      );

  static ThemeData get themeData {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: AppTypography.textTheme,
      scaffoldBackgroundColor: AppPalette.kClrWhite,
      brightness: Brightness.light,
      elevatedButtonTheme: AppButton.elevatedBtnThemeData,
      outlinedButtonTheme: AppButton.outlinedBtnThemeData,
      tabBarTheme: TabBarTheme(
        tabAlignment: TabAlignment.start,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: AppPalette.kClrBlack,
        labelStyle: AppTypography.textTheme.headlineLarge,
        unselectedLabelColor: AppPalette.kClrSliver,
        unselectedLabelStyle: AppTypography.textTheme.headlineLarge,
      ),
    );
  }
}
