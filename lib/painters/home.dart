import 'dart:math';

import 'package:flutter/material.dart';
import 'package:job_search/theme.dart';
import 'package:job_search/util/vector.dart';

class HomeIconPainter extends CustomPainter {
  final bool selected;
  late Canvas canvas;
  late Size size;

  HomeIconPainter(this.selected);
  @override
  void paint(Canvas canvas, Size size) {
    this.size = size;
    Color color =
        selected ? MyTheme.greenish : MyTheme.greenish.withOpacity(0.5);
    Path combinedPath = Path.combine(
        PathOperation.intersect, getCirclePath(), getPentagonPath());
    canvas.drawPath(
        combinedPath,
        Paint()
          ..strokeWidth = 2
          ..color = color
          ..style = PaintingStyle.fill);
  }

  Path getCirclePath() {
    double portion = 0.9;
    Path circle = Path()
      ..addOval(Rect.fromCenter(
          center: Offset(size.width * 0.5, size.height * 0.5),
          width: size.width * portion,
          height: size.height * portion));
    return circle;
  }

  Path getPentagonPath() {
    double numsize = 5;
    double offsetAngle = -(2 * pi) / numsize; //because its a regular hexagon
    Path hexagonPath = Path();
    Offset offset = Offset(size.width * 0.5, 0);
    List<Offset> points = [offset];
    VectorUtil vectorUtil = VectorUtil(size);
    for (var side = 1; side < numsize; side++) {
      offset = vectorUtil.rotate(offset, offsetAngle);
      print(offset);
      points.add(offset);
    }
    return hexagonPath..addPolygon(points, false);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true; //for now
}
