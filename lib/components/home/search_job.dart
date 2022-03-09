import 'package:flutter/material.dart';
import 'package:job_search/components/home/search_field.dart';
import 'package:job_search/icons/slide.dart';
import 'package:job_search/theme.dart';

class SearchJob extends StatelessWidget {
  final double width;
  final double height;
  const SearchJob({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double searchBarHeight = height * 0.575;
    double searchContentHeight = searchBarHeight * 0.95;
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
                style: MyTheme.style.copyWith(color: MyTheme.blackish),
              ),
            ),
            // decoration: BoxDecoration(
            //     border: Border.all(color: Colors.black, width: 2)),
          ),
          Container(
            width: width,
            height: searchBarHeight,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SearchField(
                    width: width * 0.775,
                    height: searchContentHeight,
                  ),
                  Container(
                    width: searchContentHeight,
                    height: searchContentHeight,
                    child: Center(
                      child: SlideIcon(
                        size: searchContentHeight * 0.4,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: MyTheme.greenish,
                      borderRadius:
                          BorderRadius.circular(searchContentHeight * 0.1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.05),
                          spreadRadius: 10,
                          blurRadius: 3,
                          offset: const Offset(0, 0),
                        )
                      ],
                    ),
                  )
                ]),
            // decoration: BoxDecoration(
            //   border: Border.all(color: Colors.black, width: 0.1),
            // ),
          ),
        ],
      ),
    );
  }
}
