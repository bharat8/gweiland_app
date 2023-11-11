import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gweiland_app/utils/buttons/primary_icon_button.dart';
import 'package:gweiland_app/utils/ui_constants.dart';
import 'package:gweiland_app/utils/ui_helpers.dart';
import 'package:sizer/sizer.dart';

class PrimaryCTAButton extends StatelessWidget {
  const PrimaryCTAButton({
    super.key,
    this.label = '',
    this.onTap,
    this.fitWidth = false,
    this.fitWithPrimaryCta = false,
    this.labelStyle,
    this.padding,
    this.icon,
    this.image,
  });
  final String label;
  final void Function()? onTap;
  final bool fitWidth;
  final bool fitWithPrimaryCta;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? padding;
  final PrimaryIconButton? icon;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap?.call();
      },
      child: Container(
        width: fitWidth ? 100.w : null,
        padding: padding ??
            const EdgeInsets.all(
              UIConstants.baseMargin * 2,
            ),
        decoration: BoxDecoration(
          borderRadius: UIConstants.baseBorderRadius,
          border: Border.all(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              horizontalSpaceTiny,
            ],
            Text(
              label,
              style: labelStyle ??
                  Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
