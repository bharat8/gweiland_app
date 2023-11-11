import 'package:flutter/material.dart';
import 'package:gweiland_app/utils/ui_constants.dart';
import 'package:gweiland_app/utils/ui_helpers.dart';
import 'package:sizer/sizer.dart';

Future<T?> showSheet<T extends Object?>(
  BuildContext context, {
  required Widget child,
  String title = '',
  bool isDismissible = true,
  bool enableDrag = true,
  bool isScrollControlled = true,
  bool showFullScreenSheet = false,
  EdgeInsetsGeometry padding = EdgeInsets.zero,
  Color? backgroundColor,
}) async =>
    showModalBottomSheet(
      context: context,
      backgroundColor: backgroundColor ?? Theme.of(context).cardColor,
      constraints: BoxConstraints(
        minWidth: 100.w,
        maxHeight: showFullScreenSheet ? 100.h : 80.h,
      ),
      useSafeArea: showFullScreenSheet,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      shape: UIConstants.bottomSheetShape,
      elevation: 20,
      isScrollControlled: isScrollControlled,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!showFullScreenSheet) ...[
              verticalSpaceRegular,
              Container(
                height: 0.4.h,
                width: 10.w,
                decoration: const BoxDecoration(color: Color(0xff707070)),
              ),
              verticalSpaceMedium,
            ],
            Flexible(child: child),
          ],
        ),
      ),
    );
