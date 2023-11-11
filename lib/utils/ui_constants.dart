import 'package:flutter/material.dart';

class UIConstants {
  //* PADDINGS & MARGINS
  /// Base margin
  static const baseMargin = 8.0;
  static const basePadding = 16.0;
  static const baseIconSize = 24.0;

  //* Size of standard elements.
  static const buttonBaseHeight = 56.0;
  static const buttonShortHeight = 40.0;
  static const buttonRadius = 12.0;

  static const appBarTitleHeight = 110.0;
  static const storyCircleRadius = 35.0;
  static const storyItemWidth = 70.0;
  static const textBoxHeight = 81.0;
  static const appBarLeadingWidth = 56.0;
  static const tabBarHeight = 60.0;
  static const backgroundDecorationImageHeight = 200.0;
  static const mediumSquareElementHeight = 200.0;
  static const mediumSquareElementWidth = 200.0;

  //* RADIUS
  static const baseRadius = 8.0;
  static const smallRadius = 4.0;
  static const mediumRadius = 14.0;
  static const largeRadius = 20.0;

  //* Border Radius
  static const baseBorderRadius = BorderRadius.all(
    Radius.circular(baseRadius),
  );

  static const smallBorderRadius = BorderRadius.all(
    Radius.circular(smallRadius),
  );

  static const mediumBorderRadius = BorderRadius.all(
    Radius.circular(mediumRadius),
  );

  static const largeBorderRadius = BorderRadius.all(
    Radius.circular(largeRadius),
  );

  static const buttonBorderRadius = BorderRadius.all(
    Radius.circular(buttonRadius),
  );

  static const buttonPadding = EdgeInsets.symmetric(
    vertical: baseMargin,
    horizontal: baseMargin * 2.5,
  );

  static const textFieldPadding = EdgeInsets.symmetric(
    horizontal: baseMargin * 2,
    vertical: baseMargin * 1.5,
  );

  static const bottomSheetShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(baseRadius),
    ),
  );
}
