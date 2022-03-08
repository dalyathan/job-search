import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final double width;
  final double height;
  const SearchField({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Padding(
        padding: EdgeInsets.only(left: widget.width * 0.075),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            TextField(
              style: TextStyle(fontSize: widget.height * 0.4),
              textAlign: TextAlign.left,
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide()),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
              ),
            ),
            Row(
              children: const [
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.height * 0.1),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 3,
            offset: const Offset(0, 0),
          )
        ],
        // border: Border.all(color: Colors.black, width: 1),
      ),
    );
  }
}
