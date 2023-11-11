import 'package:flutter/material.dart';
import 'package:gweiland_app/utils/app_colors.dart';
import 'package:gweiland_app/utils/ui_constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

/// Rounded Rectangle skeleton widget with shimmer effect
class Skeleton extends StatelessWidget {
  const Skeleton({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
    this.margin,
    this.durationInMilliseconds = 1500,
    this.highlightColor,
    this.isCircular = false,
  });

  final double? height;
  final double? width;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;
  final Color? highlightColor;
  final int durationInMilliseconds;
  final bool isCircular;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: Duration(milliseconds: durationInMilliseconds),
      baseColor: AppColors.lightShimmerBaseColor,
      highlightColor: AppColors.lightShimmerHighlightColor,
      child: Container(
        height: height ?? 3.h,
        width: width ?? 2.w,
        margin: margin,
        decoration: BoxDecoration(
          shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: !isCircular
              ? BorderRadius.circular(
                  borderRadius ?? UIConstants.baseRadius,
                )
              : null,
          color: Colors.white,
        ),
      ),
    );
  }
}
