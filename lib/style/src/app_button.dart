part of '../style.dart';

class AppButton {
  const AppButton._();

  static OutlinedButtonThemeData get outlinedBtnThemeData =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          backgroundColor: Palette.kClrWhite,
          foregroundColor: Palette.kClrBlack,
        ),
      );

  static ElevatedButtonThemeData get elevatedBtnThemeData =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Palette.kClrWhite,
          backgroundColor: Palette.kClrBlack,
        ),
      );
}
