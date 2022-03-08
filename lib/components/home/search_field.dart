import 'package:flutter/material.dart';
import 'package:job_search/theme.dart';

import '../../icons/search.dart';

class SearchField extends StatefulWidget {
  final double width;
  final double height;
  const SearchField({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool fieldNotFocused = true;
  final textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var fontSize = widget.height * 0.4;
    return Container(
      width: widget.width,
      height: widget.height,
      child: Padding(
        padding: EdgeInsets.only(left: widget.width * 0.075),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            FocusScope(
              child: Focus(
                onFocusChange: (focus) => setState(() {
                  fieldNotFocused = focus ? false : true;
                }),
                child: TextField(
                  controller: textEditingController,
                  style: TextStyle(fontSize: fontSize),
                  textAlign: TextAlign.left,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none),
                ),
              ),
            ),
            Visibility(
              visible:
                  fieldNotFocused && textEditingController.value.text.isEmpty,
              child: SizedBox(
                width: widget.width * 0.35,
                height: fontSize,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchIcon(
                      size: fontSize * 0.8,
                    ),
                    SizedBox(
                      height: fontSize,
                      child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            'Search',
                            style: MyTheme.style
                                .copyWith(color: Colors.grey[300]!),
                          )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.height * 0.1),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
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
