import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/constants/Constant.dart';

class SearchListWidget extends StatelessWidget {
  String title;
  String image;
  String overView;
  String releaseDate;

  SearchListWidget(
      {required this.title,
      required this.image,
      required this.releaseDate,
      required this.overView});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          border: Border(
            bottom: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
        ),
        width: double.infinity,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    "${Constant.imagePath}${image}",
                    width: 100,
                    height: 100,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          textAlign: TextAlign.start,
                          """$title""",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                            textAlign: TextAlign.start,
                            releaseDate,
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
              // Divider(
              //   color: Colors.white,
              //   height: 2,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
