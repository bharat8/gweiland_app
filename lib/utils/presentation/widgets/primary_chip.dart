import 'package:flutter/material.dart';
import 'package:gweiland_app/utils/buttons/primary_icon_button.dart';
import 'package:gweiland_app/utils/ui_constants.dart';
import 'package:gweiland_app/utils/ui_helpers.dart';

class PrimaryChip extends StatelessWidget {
  const PrimaryChip({
    required this.label,
    this.focused = false,
    this.inSheet = false,
    this.expand = false,
    this.leadingIconButton,
    this.trailingIconButton,
    this.hasRoundedBorders = true,
    this.labelTextStyle,
    this.labelPadding,
    this.chipColor,
    this.focusColor,
    this.borderRadius,
    this.borderWidth,
    this.isGradientText = false,
    this.onTap,
    super.key,
  });
  final String label;
  final bool focused;
  final bool inSheet;
  final bool expand;
  final PrimaryIconButton? leadingIconButton;
  final PrimaryIconButton? trailingIconButton;
  final bool hasRoundedBorders;
  final TextStyle? labelTextStyle;
  final EdgeInsets? labelPadding;
  final Color? chipColor;
  final Color? focusColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? borderWidth;
  final bool isGradientText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: labelPadding ??
                const EdgeInsets.symmetric(
                  vertical: UIConstants.baseMargin * 0.9,
                  horizontal: UIConstants.baseMargin * 3,
                ),
            margin: borderWidth ??
                const EdgeInsets.all(
                  UIConstants.baseMargin * 0.3,
                ),
            decoration: BoxDecoration(
              color: focused
                  ? focusColor ?? Colors.blue.shade400
                  : Colors.grey.withOpacity(0.2),
              borderRadius: hasRoundedBorders
                  ? BorderRadius.circular(100)
                  : borderRadius ?? UIConstants.baseBorderRadius,
            ),
            child: Row(
              mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
              children: [
                if (leadingIconButton != null) ...[
                  leadingIconButton!,
                  horizontalSpaceSmall,
                ],
                Flexible(
                  child: Text(
                    label,
                    style: labelTextStyle ??
                        Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: focused ? Colors.white : Colors.black,
                            ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ),
                if (trailingIconButton != null) ...[
                  horizontalSpaceSmall,
                  trailingIconButton!,
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
