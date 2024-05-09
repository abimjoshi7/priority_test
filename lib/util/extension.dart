import 'package:flutter/material.dart';

MediaQueryData mediaQueryData = MediaQueryData.fromView(
    WidgetsBinding.instance.platformDispatcher.views.single);

// These are the Viewport values of iPhone 13 Mini.
const num kWidth = 375;
const num kHeight = 812;
const num kStatusBar = 0;

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
