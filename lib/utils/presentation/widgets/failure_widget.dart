import 'package:flutter/material.dart';
import 'package:gweiland_app/utils/buttons/buttons.dart';
import 'package:gweiland_app/utils/infrastructure/core/failures/failures.dart';
import 'package:gweiland_app/utils/strings_constant.dart';
import 'package:gweiland_app/utils/ui_constants.dart';
import 'package:gweiland_app/utils/ui_helpers.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';

/// Display widget for empty states of an API call
class FailureWidget extends StatelessWidget {
  const FailureWidget({
    super.key,
    this.message = ErrorStringConstants.failureText,
    this.networkImage = false,
    this.imagePath,
    this.actionButton,
    this.hasBackground = false,
    this.backgroundColor,
    this.imageSize,
    this.descStyle,
  });

  final String message;

  /// Path of the asset image
  final bool networkImage;
  final String? imagePath;
  final Widget? actionButton;
  final bool hasBackground;
  final Color? backgroundColor;
  final Size? imageSize;
  final TextStyle? descStyle;

  @override
  Widget build(BuildContext context) {
    return hasBackground
        ? Material(
            color: backgroundColor,
            child: _Display(
              imagePath: imagePath,
              networkImage: networkImage,
              message: message,
              actionButton: actionButton,
              imageSize: imageSize,
              descStyle: descStyle,
            ),
          )
        : _Display(
            imagePath: imagePath,
            networkImage: networkImage,
            message: message,
            actionButton: actionButton,
            imageSize: imageSize,
            descStyle: descStyle,
          );
  }
}

class _Display extends StatelessWidget {
  const _Display({
    required this.imageSize,
    required this.imagePath,
    required this.networkImage,
    required this.message,
    required this.actionButton,
    required this.descStyle,
  });

  final Size? imageSize;
  final String? imagePath;
  final bool networkImage;
  final String message;
  final Widget? actionButton;
  final TextStyle? descStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        UIConstants.baseMargin * 2,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryIconButton(
              icon: PhosphorIcons.cloudX(),
              iconSize: 30.w,
            ),
            verticalSpaceMedium,
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            if (actionButton != null) ...[
              verticalSpaceRegular,
              actionButton!,
            ],
          ],
        ),
      ),
    );
  }
}

Widget failureHandler(
  Failure? f,
  VoidCallback onTap,
) {
  return f?.maybeWhen(
        orElse: () {
          return const SizedBox.shrink();
        },
        serverError: (code, message, errorResponse) {
          return FailureWidget(
            message: message ?? ErrorStringConstants.internalError,
            actionButton: PrimaryCTAButton(
              label: ErrorStringConstants.retry,
              onTap: onTap,
            ),
          );
        },
        connection: () {
          return FailureWidget(
            message: ErrorStringConstants.noConnection,
            actionButton: PrimaryCTAButton(
              label: ErrorStringConstants.retry,
              onTap: onTap,
            ),
          );
        },
        localError: (message) {
          return FailureWidget(
            message: message ?? ErrorStringConstants.internalError,
            actionButton: PrimaryCTAButton(
              label: ErrorStringConstants.retry,
              onTap: onTap,
            ),
          );
        },
        unexpected: (message) {
          return FailureWidget(
            message: message ?? ErrorStringConstants.internalError,
            actionButton: PrimaryCTAButton(
              label: ErrorStringConstants.retry,
              onTap: onTap,
            ),
          );
        },
        value: (message) {
          return FailureWidget(
            message: message ?? ErrorStringConstants.internalError,
            actionButton: PrimaryCTAButton(
              label: ErrorStringConstants.retry,
              onTap: onTap,
            ),
          );
        },
      ) ??
      const SizedBox.shrink();
}
