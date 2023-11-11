import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gweiland_app/utils/ui_constants.dart';

class PrimaryIconButton extends StatelessWidget {
  const PrimaryIconButton({
    super.key,
    this.image,
    this.icon,
    this.networkIcon = false,
    this.size = const Size(
      UIConstants.baseIconSize * 2,
      UIConstants.baseIconSize * 2,
    ),
    this.hasBorder = false,
    this.borderWidth = 1,
    this.borderColor = Colors.black38,
    this.onTap,
    this.onTapDown,
    this.onLongPress,
    this.padding = EdgeInsets.zero,
    this.hasBackground = false,
    this.fit = BoxFit.fitWidth,
    this.iconColor,
    this.iconSize = UIConstants.baseIconSize,
    this.backgroundGradient,
    this.backgroundColor = Colors.black,
    this.imageColor,
    this.file,
    this.placeholder,
    this.boxShape = BoxShape.circle,
    this.borderRadius,
    this.colorBlend,
  });

  final String? image;
  final IconData? icon;
  final bool networkIcon;
  final Size? size;
  final bool hasBorder;
  final double borderWidth;
  final Color borderColor;
  final void Function()? onTap;
  final void Function(TapDownDetails detail)? onTapDown;
  final void Function()? onLongPress;
  final EdgeInsetsGeometry padding;
  final bool hasBackground;
  final BoxFit fit;
  final Color? iconColor;
  final double iconSize;
  final List<Color>? backgroundGradient;
  final Color backgroundColor;
  final Color? imageColor;
  final File? file;
  final Widget? placeholder;
  final BoxShape boxShape;
  final double? borderRadius;
  final BlendMode? colorBlend;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      onTapDown: onTapDown,
      onLongPress: onLongPress,
      child: Container(
        width: icon == null ? size?.width : null,
        height: icon == null ? size?.height : null,
        padding: hasBorder
            ? const EdgeInsets.all(
                UIConstants.baseMargin,
              )
            : padding,
        decoration: BoxDecoration(
          color: (hasBorder || hasBackground) ? backgroundColor : null,
          border: hasBorder
              ? Border.all(
                  color: borderColor,
                  width: borderWidth,
                )
              : null,
          shape: boxShape,
          gradient: backgroundGradient != null
              ? LinearGradient(
                  colors: backgroundGradient!,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          borderRadius: borderRadius != null
              ? BorderRadius.circular(borderRadius!)
              : null,
        ),
        child: icon != null
            ? Icon(
                icon,
                color: iconColor ?? Colors.black,
                size: iconSize,
              )
            : networkIcon
                ? CachedNetworkImage(
                    imageUrl: image ?? '',
                    fit: fit,
                    errorWidget: _errorWidget,
                    colorBlendMode: colorBlend,
                    color: imageColor,
                    placeholder: (context, url) =>
                        placeholder ?? const SizedBox.shrink(),
                  )
                : file != null
                    ? Image.file(
                        file!,
                        fit: fit,
                        color: imageColor,
                      )
                    : Image.asset(
                        image ?? '',
                        fit: fit,
                        color: imageColor,
                        colorBlendMode: colorBlend,
                      ),
      ),
    );
  }

  Widget _errorWidget(
    BuildContext context,
    String url,
    dynamic error,
  ) =>
      const Icon(
        Icons.broken_image_rounded,
      );
}
