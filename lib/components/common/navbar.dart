import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final double height;
  const NavBar({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: height,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
    );
  }
}
