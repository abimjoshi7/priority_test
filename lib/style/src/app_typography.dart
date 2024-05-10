part of '../style.dart';

class AppTypography {
  const AppTypography._();

  static const _bold = FontWeight.w700;
  static const _semibold = FontWeight.w600;
  static const _medium = FontWeight.w500;
  static const _regular = FontWeight.w400;

  static final double _fontSize10 = 10.fSize;
  static final double _fontSize12 = 12.fSize;
  static final double _fontSize14 = 14.fSize;
  static final double _fontSize16 = 16.fSize;
  static final double _fontSize20 = 20.fSize;
  static final double _fontSize24 = 24.fSize;
  static final double _fontSize36 = 36.fSize;
  static final double _fontSize48 = 48.fSize;

  static TextTheme get textTheme => TextTheme(
        displayMedium: TextStyle(
          fontFamily: StringRes.kFontFamily,
          fontSize: _fontSize48,
          fontWeight: _bold,
        ),
        displaySmall: TextStyle(
          fontFamily: StringRes.kFontFamily,
          fontSize: _fontSize36,
          fontWeight: _semibold,
        ),
        headlineLarge: TextStyle(
          fontFamily: StringRes.kFontFamily,
          fontSize: _fontSize24,
          fontWeight: _semibold,
        ),
        headlineMedium: TextStyle(
          fontFamily: StringRes.kFontFamily,
          fontSize: _fontSize20,
          fontWeight: _semibold,
        ),
        headlineSmall: TextStyle(
          fontFamily: StringRes.kFontFamily,
          fontSize: _fontSize16,
          fontWeight: _semibold,
        ),
        titleLarge: TextStyle(
          fontFamily: StringRes.kFontFamily,
          fontSize: _fontSize14,
          fontWeight: _semibold,
        ),
        titleMedium: TextStyle(
          fontFamily: StringRes.kFontFamily,
          fontSize: _fontSize12,
          fontWeight: _semibold,
        ),
        bodyLarge: TextStyle(
          fontFamily: StringRes.kFontFamily,
          fontSize: _fontSize16,
          fontWeight: _regular,
        ),
        bodyMedium: TextStyle(
          fontFamily: StringRes.kFontFamily,
          fontSize: _fontSize14,
          fontWeight: _regular,
        ),
        bodySmall: TextStyle(
          fontFamily: StringRes.kFontFamily,
          fontSize: _fontSize12,
          fontWeight: _regular,
        ),
        labelLarge: TextStyle(
          fontFamily: StringRes.kFontFamily,
          fontSize: _fontSize14,
          fontWeight: _medium,
        ),
        labelMedium: TextStyle(
          fontFamily: StringRes.kFontFamily,
          fontSize: _fontSize12,
          fontWeight: _medium,
        ),
        labelSmall: TextStyle(
          fontFamily: StringRes.kFontFamily,
          fontSize: _fontSize10,
          fontWeight: _medium,
        ),
      );
}
