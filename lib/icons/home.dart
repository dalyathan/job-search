import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_search/painters/home.dart';

class HomeIcon extends StatelessWidget {
  final bool selected;
  final double size;
  const HomeIcon({Key? key, required this.selected, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HomeIconPainter(selected),
      size: Size.square(size),
    );
  }
}
