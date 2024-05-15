part of '../style.dart';

class AppButton {
  const AppButton._();

  static Size get minimumSize => Size(
        90.fSize,
        55.fSize,
      );

  static OutlinedButtonThemeData get outlinedBtnThemeData =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: AppPalette.kClrOutlinedGrey,
          ),
          elevation: 0,
          backgroundColor: AppPalette.kClrWhite,
          foregroundColor: AppPalette.kClrBlack,
          minimumSize: minimumSize,
          textStyle: AppTypography.textTheme.titleLarge,
        ),
      );

  static ElevatedButtonThemeData get elevatedBtnThemeData =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppPalette.kClrBlack,
          foregroundColor: AppPalette.kClrWhite,
          minimumSize: minimumSize,
          textStyle: AppTypography.textTheme.titleLarge,
        ),
      );
}
