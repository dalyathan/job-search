import 'dart:math';

import 'package:flutter/material.dart';

class SearchIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var diagonalLength = size.height * sqrt(2);
    var circleRadius = diagonalLength * 0.8 * 0.5;
    Paint brush = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.grey[400]!
      ..strokeWidth = 1.5;
    canvas.drawCircle(Offset(circleRadius, circleRadius), circleRadius, brush);
    canvas.drawLine(Offset(circleRadius * 2, circleRadius * 2),
        Offset(size.width, size.height), brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
