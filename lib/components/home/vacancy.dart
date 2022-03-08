import 'package:flutter/material.dart';

class Vacancy extends StatelessWidget {
  final double width;
  final double height;
  const Vacancy({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(height * 0.1);
    return Material(
      borderRadius: borderRadius,
      elevation: 10,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(color: Colors.black, width: 2)),
      ),
    );
  }
}
