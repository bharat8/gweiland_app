// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';

class BullishCurve extends CustomPainter {
  BullishCurve({this.strokeWidth = 2, this.closed = false});
  final double strokeWidth;
  final bool closed;

  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path();
    path_0.moveTo(size.width * 0.01538462, size.height * 0.02657061);
    path_0.lineTo(size.width * 0.02615385, size.height * 0.1792133);
    path_0.cubicTo(
      size.width * 0.03692308,
      size.height * 0.3318556,
      size.width * 0.05846154,
      size.height * 0.6371389,
      size.width * 0.08000000,
      size.height * 0.6231056,
    );
    path_0.cubicTo(
      size.width * 0.1015385,
      size.height * 0.6090722,
      size.width * 0.1230769,
      size.height * 0.2757139,
      size.width * 0.1446154,
      size.height * 0.2103889,
    );
    path_0.cubicTo(
      size.width * 0.1661538,
      size.height * 0.1450639,
      size.width * 0.1876923,
      size.height * 0.3477700,
      size.width * 0.2092308,
      size.height * 0.4160194,
    );
    path_0.cubicTo(
      size.width * 0.2307692,
      size.height * 0.4842694,
      size.width * 0.2523077,
      size.height * 0.4180628,
      size.width * 0.2738462,
      size.height * 0.4584778,
    );
    path_0.cubicTo(
      size.width * 0.2953846,
      size.height * 0.4988933,
      size.width * 0.3169231,
      size.height * 0.6459333,
      size.width * 0.3384615,
      size.height * 0.6144556,
    );
    path_0.cubicTo(
      size.width * 0.3600000,
      size.height * 0.5829833,
      size.width * 0.3815385,
      size.height * 0.3729933,
      size.width * 0.4030769,
      size.height * 0.3793789,
    );
    path_0.cubicTo(
      size.width * 0.4246154,
      size.height * 0.3857644,
      size.width * 0.4461538,
      size.height * 0.6085222,
      size.width * 0.4676923,
      size.height * 0.7551444,
    );
    path_0.cubicTo(
      size.width * 0.4892308,
      size.height * 0.9017611,
      size.width * 0.5107692,
      size.height * 0.9722389,
      size.width * 0.5323077,
      size.height * 0.8605333,
    );
    path_0.cubicTo(
      size.width * 0.5538462,
      size.height * 0.7488333,
      size.width * 0.5753846,
      size.height * 0.4549456,
      size.width * 0.5969231,
      size.height * 0.3992889,
    );
    path_0.cubicTo(
      size.width * 0.6184615,
      size.height * 0.3436328,
      size.width * 0.6400000,
      size.height * 0.5262050,
      size.width * 0.6615385,
      size.height * 0.5678056,
    );
    path_0.cubicTo(
      size.width * 0.6830769,
      size.height * 0.6094111,
      size.width * 0.7046154,
      size.height * 0.5100428,
      size.width * 0.7261538,
      size.height * 0.5311461,
    );
    path_0.cubicTo(
      size.width * 0.7476923,
      size.height * 0.5522494,
      size.width * 0.7692308,
      size.height * 0.6938222,
      size.width * 0.7907692,
      size.height * 0.7238278,
    );
    path_0.cubicTo(
      size.width * 0.8123077,
      size.height * 0.7538333,
      size.width * 0.8338462,
      size.height * 0.6722667,
      size.width * 0.8553846,
      size.height * 0.6806722,
    );
    path_0.cubicTo(
      size.width * 0.8769231,
      size.height * 0.6890833,
      size.width * 0.8984615,
      size.height * 0.7874722,
      size.width * 0.9200000,
      size.height * 0.7317500,
    );
    path_0.cubicTo(
      size.width * 0.9415385,
      size.height * 0.6760278,
      size.width * 0.9630769,
      size.height * 0.4661983,
      size.width * 0.9738462,
      size.height * 0.3612839,
    );

    final paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    paint0Stroke.color = const Color(0xff00CE08).withOpacity(1);
    canvas.drawPath(path_0, paint0Stroke);

    if (closed) {
      path_0.lineTo(size.width, size.height);
      path_0.lineTo(0, size.height);
      path_0.lineTo(0, 0);

      final paint0Fill = Paint()..style = PaintingStyle.fill;
      paint0Fill.color = const Color(0xff00CE08).withOpacity(0.6);
      canvas.drawPath(path_0, paint0Fill);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
