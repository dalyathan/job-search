import 'dart:math';
import 'dart:ui';

class VectorUtil {
  final Size frame;

  VectorUtil(this.frame);
  Offset reflectYAxis(Offset dartianOffset) {
    Offset cartesianOffset = toCartesianCoordinate(dartianOffset);
    Offset cartesianValue = Offset(-cartesianOffset.dx, cartesianOffset.dy);
    return toDartianCoordinate(cartesianValue);
  }

  Offset reflectXAxis(Offset dartianOffset) {
    Offset cartesianOffset = toCartesianCoordinate(dartianOffset);
    Offset cartesianValue = Offset(cartesianOffset.dx, -cartesianOffset.dy);
    return toDartianCoordinate(cartesianValue);
  }

  Offset reflectYEqualsX(Offset dartianOffset) {
    Offset cartesianOffset = toCartesianCoordinate(dartianOffset);
    Offset cartesianValue = Offset(cartesianOffset.dy, cartesianOffset.dx);
    return toDartianCoordinate(cartesianValue);
  }

  Offset translate(Offset point, Offset delta) =>
      Offset(point.dx + delta.dx, point.dy + delta.dy);

  Offset rotate(Offset dartianOffset, double counterClockwiseInRadians) {
    Offset cartesianOffset = toCartesianCoordinate(dartianOffset);
    Offset cartesianValue = Offset(
        cartesianOffset.dx * cos(counterClockwiseInRadians) -
            cartesianOffset.dy * sin(counterClockwiseInRadians),
        cartesianOffset.dx * sin(counterClockwiseInRadians) +
            cartesianOffset.dy * cos(counterClockwiseInRadians));
    return toDartianCoordinate(cartesianValue);
  }

  List<Offset> rotatePolygon(
          List<Offset> dartianOffsets, double counterClockwiseInRadians) =>
      dartianOffsets
          .map((offset) => rotate(offset, counterClockwiseInRadians))
          .toList();

  Offset toDartianCoordinate(Offset cartesianPoint) => Offset(
      cartesianPoint.dx + frame.width * 0.5,
      frame.height * 0.5 - cartesianPoint.dy);

  Offset toCartesianCoordinate(Offset dartianPoint) => Offset(
      dartianPoint.dx - frame.width * 0.5,
      frame.height * 0.5 - dartianPoint.dy);
}
