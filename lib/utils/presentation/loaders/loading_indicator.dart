import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gweiland_app/utils/ui_constants.dart';
import 'package:sizer/sizer.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    this.message = 'Loading...',
    this.showMessage = false,
    this.show = true,
    this.hasBackground = false,
    this.backgroundColor = Colors.black54,
    this.size = UIConstants.baseIconSize * 8,
    this.smallLoader = false,
  });

  final String message;
  final bool showMessage;
  final bool show;
  final bool hasBackground;
  final Color backgroundColor;
  final double size;
  final bool smallLoader;

  @override
  Widget build(BuildContext context) {
    if (!show) return const SizedBox.shrink();

    if (hasBackground) {
      return Material(
        color: backgroundColor,
        child: _AppIndicator(
          message: message,
          size: smallLoader ? UIConstants.baseIconSize * 4 : size,
          showMessage: showMessage,
        ),
      );
    } else {
      return _AppIndicator(
        message: message,
        size: smallLoader ? UIConstants.baseIconSize * 4 : size,
        showMessage: showMessage,
      );
    }
  }
}

class _AppIndicator extends StatelessWidget {
  const _AppIndicator({
    required this.message,
    required this.size,
    required this.showMessage,
  });

  final String message;
  final double size;
  final bool showMessage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SpinKitDoubleBounce(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            size: UIConstants.baseIconSize * 2,
          ),
        ),
        if (showMessage)
          Positioned(
            left: 0,
            right: 0,
            bottom: 25.h,
            child: Center(
              child: Text(
                message,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
      ],
    );
  }
}
