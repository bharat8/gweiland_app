import 'package:flutter/material.dart';
import 'package:gweiland_app/utils/buttons/primary_icon_button.dart';
import 'package:gweiland_app/utils/ui_constants.dart';

AppBar customAppbar(
  BuildContext context, {
  VoidCallback? backTap,
  String label = '',
  bool showLeadingIcon = true,
  bool isTranslucent = false,
  bool bigHeight = false,
  Widget? appTitleWidget,
  bool showLeadingCross = false,
  List<Widget>? actions,
  bool showCrossInAction = false,
  Widget? leadingIcon,
  Color? appBarColor,
  bool hasRoundedBorders = true,
  TextStyle? labelStyle,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: appBarColor ??
        (isTranslucent ? Colors.black.withOpacity(0.4) : Colors.transparent),
    toolbarHeight: bigHeight ? kToolbarHeight + 20 : kToolbarHeight + 10,
    leading: showLeadingIcon
        ? Padding(
            padding: const EdgeInsets.all(
              UIConstants.baseMargin,
            ),
            child: leadingIcon ??
                PrimaryIconButton(
                  icon:
                      showLeadingCross ? Icons.close : Icons.arrow_back_rounded,
                  hasBackground: true,
                  onTap: backTap ?? () => Navigator.pop(context),
                  padding: const EdgeInsets.all(
                    UIConstants.baseMargin,
                  ),
                ),
          )
        : null,
    leadingWidth: showLeadingIcon ? 70 : 0,
    shape: hasRoundedBorders
        ? const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(UIConstants.mediumRadius),
            ),
          )
        : null,
    centerTitle: false,
    title: appTitleWidget ??
        Text(
          label,
          style: labelStyle ?? Theme.of(context).textTheme.titleMedium,
        ),
    actions: showCrossInAction
        ? [
            Padding(
              padding: const EdgeInsets.only(
                right: UIConstants.baseMargin * 3,
              ),
              child: PrimaryIconButton(
                icon: Icons.close,
                hasBackground: true,
                onTap: () => Navigator.pop(context),
                padding: const EdgeInsets.all(
                  UIConstants.baseMargin,
                ),
              ),
            ),
          ]
        : actions,
  );
}
