import 'package:flutter/material.dart';
import 'package:job_search/theme.dart';

class SaveIconPainter extends CustomPainter {
  final bool saved;

  SaveIconPainter(this.saved);
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    double triangleTipRatio = 0.225;
    Path path = Path()
      ..addPolygon([
        const Offset(0, 0),
        Offset(size.width, 0),
        Offset(size.width, size.height),
        Offset(size.width * 0.5, size.height * (1 - triangleTipRatio)),
        Offset(0, size.height),
      ], true);
    RRect cutter = RRect.fromRectAndRadius(
        Rect.fromCenter(
            center: Offset(size.width * 0.5, size.height * 0.5),
            width: size.width,
            height: size.height),
        Radius.circular(size.height * 0.2));
    Path rrectPath = Path()..addRRect(cutter);
    Path combined = Path.combine(PathOperation.intersect, rrectPath, path);
    double borderWidth = 1;
    late Paint paint;
    if (saved) {
      paint = Paint()
        ..color = MyTheme.greenish
        ..strokeWidth = borderWidth
        ..style = PaintingStyle.fill;
    } else {
      paint = Paint()
        ..color = Colors.black
        ..strokeWidth = borderWidth
        ..style = PaintingStyle.stroke;
    }
    canvas.drawPath(combined, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
  // saved != (oldDelegate as SaveIconPainter).saved;
}
