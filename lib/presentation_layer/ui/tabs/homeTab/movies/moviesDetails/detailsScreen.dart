import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/DI/dI.dart';
import 'package:untitled/constants/Constant.dart';
import 'package:untitled/presentation_layer/ui/tabs/homeTab/movies/MoreLikeMovies/moreLikeView.dart';
import 'package:untitled/presentation_layer/ui/tabs/homeTab/movies/moviesDetails/detailsViewModel.dart';
import '../../../../../../domain_layer/entities/DetailsEntity/DetailsEntity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatefulWidget {
  String id;
  String desription;
  DetailsEntity detailsEntity;
  DetailsScreen({required this.detailsEntity, required this.id , required this.desription});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isAddedToWatchlist = false;
  DetailsViewModel detailsViewModel = getIt<DetailsViewModel>();
  @override
  void initState() {
    detailsViewModel.movieDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(18, 18, 18, 1),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                  '${Constant.imagePath}${widget.detailsEntity.backdropPath}'),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  '${widget.detailsEntity.title}',
                  style:  TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  '${widget.detailsEntity.releaseDate}',
                  style:  TextStyle(
                    color: Color(0xFFB5B4B4),
                    fontSize: 10.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        '${Constant.imagePath}${widget.detailsEntity.posterPath}',
                        height: 199.h,
                        width: 129.w,
                      ),
                      Positioned(
                        left: 6.sp,
                        child: Image.asset(
                          "assests/images/img_4.png",
                          width: 27.w,
                          height: 36.h,
                        ),
                      ),
                      Positioned(
                        left: 8.sp,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: 30.h,
                          ),
                          child:ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.detailsEntity.genres!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: FittedBox(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                    child: Center(
                                      child: Text(
                                        widget.detailsEntity.genres![index].name ?? "",
                                        style: TextStyle(color: Colors.white, fontSize: 10.sp),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 8.h,),
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(widget.desription , style:   TextStyle(color: Color.fromRGBO(203, 203, 203, 1) , fontSize: 13.sp),),
                        ),
                        SizedBox(height: 5.h,),
                        Row(
                          children: [
                            Icon(Icons.star,color: Color.fromRGBO(255, 187, 59, 1),size: 20.sp,),
                            SizedBox(width: 5.w,),
                            Text(widget.detailsEntity.voteAverage.toString() ?? "" , style:  TextStyle(color: Colors.white , fontSize: 13.sp),),
                          ],
                        ),

                        // Text(widget.),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h,),
              MoreLikeView(id: widget.id),
            ],
          ),
        ));
  }
}