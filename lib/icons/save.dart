import 'package:flutter/material.dart';
import 'package:job_search/theme.dart';

import '../painters/save.dart';

class SaveIcon extends StatefulWidget {
  final bool isSaved;
  final double size;
  const SaveIcon({Key? key, required this.isSaved, required this.size})
      : super(key: key);

  @override
  State<SaveIcon> createState() => _SaveIconState();
}

class _SaveIconState extends State<SaveIcon> {
  late bool saved;
  @override
  void initState() {
    super.initState();
    saved = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = Size(widget.size, widget.size * 1.2);
    return SizedBox(
      width: size.width,
      height: size.height,
      child: InkWell(
        onTap: (() => setState(() {
              saved = saved ? false : true;
            })),
        child: Stack(alignment: Alignment.center, children: [
          CustomPaint(
            painter: SaveIconPainter(saved),
            size: size,
          ),
          Align(
            alignment: const Alignment(0, -0.175),
            child: Icon(
              Icons.check,
              color: saved ? Colors.white : Colors.black,
              size: widget.size * 0.5,
            ),
          ),
        ]),
      ),
    );
  }
}
