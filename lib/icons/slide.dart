import 'package:flutter/material.dart';
import 'package:job_search/painters/slide.dart';

class SlideIcon extends StatelessWidget {
  final double size;
  const SlideIcon({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SlideIconPainter(),
      size: Size.square(size),
    );
  }
}
