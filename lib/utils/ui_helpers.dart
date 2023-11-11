//* Horizontal Spacing
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gweiland_app/utils/ui_constants.dart';

const Widget horizontalSpaceTiny = SizedBox(width: UIConstants.baseMargin / 2);
const Widget horizontalSpaceSmall = SizedBox(width: UIConstants.baseMargin);
const Widget horizontalSpaceRegular =
    SizedBox(width: UIConstants.baseMargin * 2);
const Widget horizontalSpaceMedium =
    SizedBox(width: UIConstants.baseMargin * 3);
const Widget horizontalSpaceLarge = SizedBox(width: UIConstants.baseMargin * 4);
const Widget bundleHorizontalSpacing =
    SizedBox(width: UIConstants.baseMargin * 1.5);

//* Vertical Spacing
const Widget verticalSpaceTiny = SizedBox(height: UIConstants.baseMargin / 2);
const Widget verticalSpaceSmall = SizedBox(height: UIConstants.baseMargin);
const Widget verticalSpaceRegular =
    SizedBox(height: UIConstants.baseMargin * 2);
const Widget verticalSpaceMedium = SizedBox(height: UIConstants.baseMargin * 3);
const Widget verticalSpaceLarge = SizedBox(height: UIConstants.baseMargin * 4);
const Widget bundleVerticalSpacing =
    SizedBox(height: UIConstants.baseMargin * 1.5);

/// Calculates the scroll offset for given scroll controller.
/// [scrollOffsetThreshold] is the threshold offset for controller
/// default is 0.7(70%)
bool isBottom(
  ScrollController scrollController, [
  double scrollOffsetThreshold = 0.7,
]) {
  if (!scrollController.hasClients ||
      scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
    return false;
  }

  final maxScroll = scrollController.position.maxScrollExtent;
  final currentScroll = scrollController.offset;

  return currentScroll >= (maxScroll * scrollOffsetThreshold) &&
      currentScroll > 0;
}

extension HexColor on Color {
  /// Prefixes a hash sign if [leadingHashSign]
  /// is set to `true` (default is `false`).
  String toHex({bool leadingHashSign = false}) =>
      '${leadingHashSign ? '#' : ''}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';

  /// String is in the format "aabbcc" or "ffaabbcc"
  /// with an optional leading "#".
  static Color fromHex(
    String hexString, {
    Color defaultColor = Colors.black,
  }) {
    try {
      final buffer = StringBuffer();
      if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
      buffer.write(hexString.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (_) {
      return defaultColor;
    }
  }
}

extension StringExtensions on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
