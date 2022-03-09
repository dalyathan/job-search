import 'package:flutter/material.dart';

class SlideIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var shortDash = size.width * 0.3;
    var longDash = size.width * 0.55;
    double strokeWidth = 2;
    var verticalBar = (size.height / 3) * 0.9;

    Paint brush = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = Colors.white;
    //top slide
    Offset A = Offset(0, verticalBar * 0.5);
    Offset B = Offset(shortDash, A.dy);
    Offset C = Offset(size.width - longDash, 0);
    Offset D = Offset(C.dx, verticalBar);
    Offset E = Offset(size.width, B.dy);
    //middle slide
    Offset F = Offset(0, (size.height / 3) * 1.5);
    Offset G = Offset(longDash, F.dy - verticalBar * 0.5);
    Offset H = Offset(G.dx, G.dy + verticalBar);
    Offset I = Offset(size.width - shortDash, F.dy);
    Offset J = Offset(size.width, F.dy);
    //bottom slide
    Offset K = Offset(0, size.height - verticalBar * 0.5);
    Offset L = Offset(shortDash, K.dy);
    Offset M = Offset(size.width - longDash, size.height - verticalBar);
    Offset N = Offset(M.dx, size.height);
    Offset O = Offset(size.width, K.dy);

    Path iconPath = Path()
      ..moveTo(A.dx, A.dy)
      ..lineTo(B.dx, B.dy)
      ..moveTo(C.dx, C.dy)
      ..lineTo(D.dx, D.dy)
      ..moveTo(C.dx, B.dy)
      ..lineTo(E.dx, E.dy)
      ..moveTo(F.dx, F.dy)
      ..lineTo(G.dx, F.dy)
      ..moveTo(G.dx, G.dy)
      ..lineTo(H.dx, H.dy)
      ..moveTo(I.dx, I.dy)
      ..lineTo(J.dx, J.dy)
      ..moveTo(K.dx, K.dy)
      ..lineTo(L.dx, L.dy)
      ..moveTo(M.dx, M.dy)
      ..lineTo(N.dx, N.dy)
      ..moveTo(M.dx, L.dy)
      ..lineTo(O.dx, O.dy);

    canvas.drawPath(iconPath, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
