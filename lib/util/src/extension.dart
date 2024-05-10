part of '../util.dart';

MediaQueryData mediaQueryData = MediaQueryData.fromView(
    WidgetsBinding.instance.platformDispatcher.views.single);

const num kWidth = 375;
const num kHeight = 872;
const num kStatusBar = 44;

///This extension is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
extension ResponsiveExtension on num {
  ///This method is used to get device viewport width.
  num get _width {
    return mediaQueryData.size.width;
  }

  ///This method is used to get device viewport height.
  num get _height {
    num statusBar = mediaQueryData.viewPadding.top;
    num bottomBar = mediaQueryData.viewPadding.bottom;
    num screenHeight = mediaQueryData.size.height - statusBar - bottomBar;
    return screenHeight;
  }

  ///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
  double get h => ((this * _width) / kWidth);

  ///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
  double get v => (this * _height) / (kHeight - kStatusBar);

  ///This method is used to set smallest px in image height and width
  double get adaptSize {
    var height = v;
    var width = h;
    return height < width ? height.toDoubleValue() : width.toDoubleValue();
  }

  ///This method is used to set text font size according to Viewport
  double get fSize => adaptSize;
}

extension FormatExtension on double {
  /// Return a [double] value with formatted according to provided fractionDigits
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(
      toStringAsFixed(
        fractionDigits,
      ),
    );
  }
}

/// text styles, colors, and showing bottom sheets and snack bars.
extension BuildContextEntension<T> on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  Size get size => MediaQuery.of(this).size;

  // * Text styles
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;

  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;

  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;

  // * Colors

  Color get primary => Theme.of(this).colorScheme.primary;

  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  Color get secondary => Theme.of(this).colorScheme.secondary;

  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;

  Color get canvasColor => Theme.of(this).canvasColor;

  Color get cardColor => Theme.of(this).cardColor;

  Color get disabledColor => Theme.of(this).disabledColor;

  Color get focusColor => Theme.of(this).focusColor;

  Color get highlightColor => Theme.of(this).highlightColor;

  Color get hintColor => Theme.of(this).hintColor;

  Color get indicatorColor => Theme.of(this).indicatorColor;

  Color get errorColor => Theme.of(this).colorScheme.error;

  Color get containerColor => Theme.of(this).colorScheme.primaryContainer;

  Color get background => Theme.of(this).colorScheme.background;

  Color get unselectedWidgetColor => Theme.of(this).unselectedWidgetColor;

  // * Popups
  /// Shows a modal bottom sheet with the given [child] widget.
  /// Additional customization options are available via named parameters.
  // Future<T?> showBottomSheet(
  //   Widget child, {
  //   bool isScrollControlled = true,
  //   bool useSafeArea = true,
  //   Color? backgroundColor,
  //   Color? barrierColor,
  //   BoxConstraints? constraints,
  //   bool? showDragHandle,
  //   bool isDismissible = true,
  //   bool enableDrag = false,
  //   bool canPop = false,
  // }) {
  //   // Cache the MediaQuery data to avoid multiple lookups.
  //   return showModalBottomSheet(
  //     enableDrag: enableDrag,
  //     showDragHandle: showDragHandle,
  //     context: this,
  //     isScrollControlled: isScrollControlled,
  //     useSafeArea: useSafeArea,
  //     barrierColor: barrierColor,
  //     backgroundColor: backgroundColor,
  //     isDismissible: isDismissible,
  //     constraints: constraints,
  //     builder: (context) {
  //       return PopScope(
  //         canPop: canPop,
  //         onPopInvoked: (didPop) async {
  //           if (didPop) return;

  //           final bool? shouldPop = await showDialog(
  //             context: context,
  //             builder: (context) => ExitFormDialog(),
  //           );

  //           if (shouldPop ?? false) {
  //             Navigator.pop(context);
  //           }
  //         },
  //         child: Padding(
  //           padding: EdgeInsets.only(
  //             bottom: MediaQuery.viewInsetsOf(context).bottom,
  //             left: 8,
  //             right: 8,
  //             top: 8,
  //           ),
  //           child: child,
  //         ),
  //       );
  //     },
  //   );
  // }

  /// Shows a snack bar with the given [message].
  /// Additional customization options are available via named parameters.
  // ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
  //   String message, {
  //   bool showAction = false,
  //   VoidCallback? onPressed,
  //   bool isSuccessful = false,
  // }) {
  //   final mediaQueryData = MediaQuery.of(this);
  //   ScaffoldMessenger.of(this).clearSnackBars();
  //   return ScaffoldMessenger.of(this).showSnackBar(
  //     SnackBar(
  //       elevation: 4,
  //       showCloseIcon: true,
  //       behavior: SnackBarBehavior.floating,
  //       margin: 16.paddingAll,
  //       padding: EdgeInsets.only(
  //         bottom: mediaQueryData.viewInsets.bottom,
  //       ),
  //       content: Center(
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Row(
  //             children: [
  //               Icon(
  //                 isSuccessful
  //                     ? Icons.done_rounded
  //                     : Icons.warning_amber_rounded,
  //                 color: isSuccessful ? kClrGreen : kClrRed,
  //               ),
  //               16.widthBox,
  //               Flexible(
  //                 child: Text(
  //                   message,
  //                   maxLines: 2,
  //                   overflow: TextOverflow.ellipsis,
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //       action: showAction
  //           ? SnackBarAction(
  //               label: "Go",
  //               onPressed: onPressed ?? () {},
  //             )
  //           : null,
  //     ),
  //   );
  // }
}
