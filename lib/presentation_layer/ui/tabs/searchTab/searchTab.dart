import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/presentation_layer/ui/tabs/searchTab/search.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: const Color.fromRGBO(18, 19, 18, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    showSearch(context: context, delegate: Search());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.white, width: 1),
                        color: Color.fromRGBO(81, 79, 79, 1)),
                    width: 343,
                    height: 48,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Search",
                              style: TextStyle(
                                  color: Colors.white24, fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200.h,
              ),
              Image.asset(
                "assests/images/img_6.png",
                height: 150.h,
                width: 100.w,
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                textAlign: TextAlign.center,
                "Search for your favourite movie here",
                style: TextStyle(color: Colors.grey, fontSize: 18.sp),
              ),
            ],
          ),
        ),
      ],
    );
  }
}