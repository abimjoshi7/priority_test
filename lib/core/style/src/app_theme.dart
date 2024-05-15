part of '../style.dart';

class AppTheme {
  const AppTheme._();

  static ColorScheme get colorScheme => const ColorScheme(
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
        onPrimaryContainer: AppPalette.kClrSliver,
        outline: AppPalette.kClrOutlinedGrey,
        tertiary: AppPalette.kClrGreen,
      );

  static ThemeData get themeData {
    return ThemeData(
      appBarTheme: AppBarTheme(
        titleTextStyle: AppTypography.textTheme.headlineMedium?.copyWith(
          color: AppPalette.kClrBlack,
        ),
      ),
      brightness: Brightness.light,
      chipTheme: const ChipThemeData(
        showCheckmark: false,
        shape: StadiumBorder(
          side: BorderSide(
            color: AppPalette.kClrOutlinedGrey,
          ),
        ),
      ),
      colorScheme: colorScheme,
      elevatedButtonTheme: AppButton.elevatedBtnThemeData,
      outlinedButtonTheme: AppButton.outlinedBtnThemeData,
      sliderTheme: SliderThemeData(
        activeTrackColor: AppPalette.kClrBlack,
        trackHeight: 1.5,
        rangeThumbShape: const CircleThumbShape(),
        inactiveTrackColor: AppPalette.kClrPaleGrey,
        valueIndicatorColor: AppPalette.kClrBlack,
        valueIndicatorTextStyle: AppTypography.textTheme.labelLarge?.copyWith(
          color: AppPalette.kClrWhite,
        ),
        showValueIndicator: ShowValueIndicator.always,
        rangeValueIndicatorShape: const PaddleRangeSliderValueIndicatorShape(),
      ),
      scaffoldBackgroundColor: AppPalette.kClrWhite,
      inputDecorationTheme: InputDecorationTheme(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppPalette.kClrBlack,
            ),
          ),
          floatingLabelStyle: AppTypography.textTheme.labelLarge,
          labelStyle: AppTypography.textTheme.labelLarge,
          activeIndicatorBorder: const BorderSide(
            color: AppPalette.kClrBlack,
          )),
      tabBarTheme: TabBarTheme(
        tabAlignment: TabAlignment.start,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: AppPalette.kClrBlack,
        labelStyle: AppTypography.textTheme.headlineLarge,
        unselectedLabelColor: AppPalette.kClrSliver,
        unselectedLabelStyle: AppTypography.textTheme.headlineLarge,
      ),
      textTheme: AppTypography.textTheme,
    );
  }
}

class CircleThumbShape extends RangeSliderThumbShape {
  const CircleThumbShape({this.thumbRadius = 10.0});

  final double thumbRadius;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required SliderThemeData sliderTheme,
    bool? isDiscrete,
    bool? isEnabled,
    bool? isOnTop,
    TextDirection? textDirection,
    Thumb? thumb,
    bool? isPressed,
  }) {
    final Canvas canvas = context.canvas;

    final Paint fillPaint = Paint()
      ..color = AppPalette.kClrBlack
      ..style = PaintingStyle.fill;
    final Paint fillPaint2 = Paint()
      ..color = AppPalette.kClrWhite
      ..style = PaintingStyle.fill;

    canvas
      ..drawCircle(center, thumbRadius, fillPaint)
      ..drawCircle(
        center,
        thumbRadius / 2,
        fillPaint2,
      );
  }
}
