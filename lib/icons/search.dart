import 'package:flutter/material.dart';
import 'package:job_search/painters/search.dart';

class SearchIcon extends StatelessWidget {
  final double size;
  const SearchIcon({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SearchIconPainter(),
      size: Size.square(size),
    );
  }
}
