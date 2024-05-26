import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/presentation_layer/ui/tabs/homeTab/movies/newReleaseMovies/newReleaseView.dart';
import 'package:untitled/presentation_layer/ui/tabs/homeTab/movies/popularMovies/popularMovieView.dart';
import 'package:untitled/presentation_layer/ui/tabs/homeTab/movies/recommendedMovies/recommendedView.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: const Color.fromRGBO(18, 18, 18, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding:
                //   EdgeInsets.only(left: 5, bottom: 7, top: 10),
                //   child: Text(
                //     "Popular Movies",
                //     style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 20,
                //         fontWeight: FontWeight.w400),
                //   ),
                // ),
                PopularMovieView(),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: const Color.fromRGBO(40, 42, 40, 1),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5, bottom: 7, top: 10),
                  child: Text(
                    textAlign: TextAlign.start,
                    "New Releases ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                NewReleaseMovieView()
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 25.h,),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: const Color.fromRGBO(40, 42, 40, 1),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5, bottom: 7, top: 10),
                  child: Text(
                    textAlign: TextAlign.start,
                    "Recommended ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                RecommendedMovieView()
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 25.h,),
        ),
      ],
    );
  }
}
