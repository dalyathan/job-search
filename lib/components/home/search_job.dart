import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_search/theme.dart';

class SearchJob extends StatelessWidget {
  final double width;
  final double height;
  const SearchJob({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width * 0.8,
            child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  "Find your Dream Job!",
                  style: GoogleFonts.poppins(color: MyTheme.blackish),
                )),
            // decoration: BoxDecoration(
            //     border: Border.all(color: Colors.black, width: 2)),
          ),
          Container(
            width: width,
            height: height * 0.6,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2)),
          ),
        ],
      ),
    );
  }
}
