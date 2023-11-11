// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';

class BearishCurve extends CustomPainter {
  BearishCurve({this.strokeWidth = 2, this.closed = false});
  final double strokeWidth;
  final bool closed;

  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path();
    path_0.moveTo(size.width * 0.01538462, size.height * 0.03846154);
    path_0.lineTo(size.width * 0.02548077, size.height * 0.1759404);
    path_0.cubicTo(
      size.width * 0.03557692,
      size.height * 0.3134196,
      size.width * 0.05576923,
      size.height * 0.5883769,
      size.width * 0.07596154,
      size.height * 0.5821115,
    );
    path_0.cubicTo(
      size.width * 0.09615385,
      size.height * 0.5758423,
      size.width * 0.1163462,
      size.height * 0.2883481,
      size.width * 0.1365385,
      size.height * 0.2369096,
    );
    path_0.cubicTo(
      size.width * 0.1567308,
      size.height * 0.1854712,
      size.width * 0.1769231,
      size.height * 0.3700877,
      size.width * 0.1971154,
      size.height * 0.4362885,
    );
    path_0.cubicTo(
      size.width * 0.2173077,
      size.height * 0.5024885,
      size.width * 0.2375000,
      size.height * 0.4502731,
      size.width * 0.2576923,
      size.height * 0.4919615,
    );
    path_0.cubicTo(
      size.width * 0.2778846,
      size.height * 0.5336462,
      size.width * 0.2980769,
      size.height * 0.6692385,
      size.width * 0.3182692,
      size.height * 0.6476115,
    );
    path_0.cubicTo(
      size.width * 0.3384615,
      size.height * 0.6259846,
      size.width * 0.3586538,
      size.height * 0.4471385,
      size.width * 0.3788462,
      size.height * 0.4588577,
    );
    path_0.cubicTo(
      size.width * 0.3990385,
      size.height * 0.4705731,
      size.width * 0.4192308,
      size.height * 0.6728500,
      size.width * 0.4394231,
      size.height * 0.8080731,
    );
    path_0.cubicTo(
      size.width * 0.4596154,
      size.height * 0.9432923,
      size.width * 0.4798077,
      size.height * 1.011454,
      size.width * 0.5000000,
      size.height * 0.9191692,
    );
    path_0.cubicTo(
      size.width * 0.5201923,
      size.height * 0.8268846,
      size.width * 0.5403846,
      size.height * 0.5741538,
      size.width * 0.5605769,
      size.height * 0.5312308,
    );
    path_0.cubicTo(
      size.width * 0.5807692,
      size.height * 0.4883077,
      size.width * 0.6009615,
      size.height * 0.6551923,
      size.width * 0.6211538,
      size.height * 0.6979231,
    );
    path_0.cubicTo(
      size.width * 0.6413462,
      size.height * 0.7406577,
      size.width * 0.6615385,
      size.height * 0.6592385,
      size.width * 0.6817308,
      size.height * 0.6839154,
    );
    path_0.cubicTo(
      size.width * 0.7019231,
      size.height * 0.7085962,
      size.width * 0.7221154,
      size.height * 0.8393731,
      size.width * 0.7423077,
      size.height * 0.8718923,
    );
    path_0.cubicTo(
      size.width * 0.7625000,
      size.height * 0.9044077,
      size.width * 0.7826923,
      size.height * 0.8386654,
      size.width * 0.8028846,
      size.height * 0.8521654,
    );
    path_0.cubicTo(
      size.width * 0.8230769,
      size.height * 0.8656654,
      size.width * 0.8432692,
      size.height * 0.9584077,
      size.width * 0.8634615,
      size.height * 0.9154269,
    );
    path_0.cubicTo(
      size.width * 0.8836538,
      size.height * 0.8724462,
      size.width * 0.9038462,
      size.height * 0.6937423,
      size.width * 0.9240385,
      size.height * 0.6584308,
    );
    path_0.cubicTo(
      size.width * 0.9442308,
      size.height * 0.6231192,
      size.width * 0.9644231,
      size.height * 0.7312000,
      size.width * 0.9745185,
      size.height * 0.7852423,
    );
    path_0.lineTo(size.width * 0.9846154, size.height * 0.8392846);

    final paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    paint0Stroke.color = const Color(0xffFF3D00).withOpacity(1);
    canvas.drawPath(path_0, paint0Stroke);

    if (closed) {
      path_0.lineTo(size.width, size.height);
      path_0.lineTo(0, size.height);
      path_0.lineTo(0, 0);

      final paint0Fill = Paint()..style = PaintingStyle.fill;
      paint0Fill.color = const Color(0xffFF3D00).withOpacity(0.6);
      canvas.drawPath(path_0, paint0Fill);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
