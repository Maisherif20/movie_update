import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/constants/Constant.dart';
class PopularMoviesWidget extends StatefulWidget {
  String title;
  String imagePoster;
  String imageBack;
  String releaseDate;
  PopularMoviesWidget(
      {required this.title, required this.imagePoster, required this.releaseDate  , required this.imageBack });

  @override
  State<PopularMoviesWidget> createState() => _PopularMoviesWidgetState();
}

class _PopularMoviesWidgetState extends State<PopularMoviesWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(18, 18, 18, 1),
      ),
      padding: const EdgeInsets.only(left: 10, right: 10 , top: 10),
      width: 420.w,
      height: 289.h,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 320.w,
                  child: Image.network(
                    "${Constant.imagePath}${widget.imageBack}",
                    fit: BoxFit.fill,
                    height: 215.h,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 150 , top: 10),
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 14 , fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5.h,),
              Padding(
                padding: const EdgeInsets.only(left: 150),
                child: Text(
                  widget.releaseDate,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color.fromRGBO(181, 180, 180, 1),
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          Positioned(
            top: 50.sp,
            left: 20.sp,
            child: Stack(
              children: [
                Image.network(
                  "${Constant.imagePath}${widget.imagePoster}",
                  width: 129.w,
                  height: 199.h,
                ),
                Positioned(
                  left: 7.sp,
                  child: InkWell(
                    onTap: ()async{
                      // isSelected = true;
                      // Movie movie = Movie(title: widget.title , posterImagePath: widget.imagePoster, releaseData: widget.releaseDate);
                      // await MovieDao.addMovieToFireBase(movie);
                      setState(() {
                      });
                    },
                    child: Stack(children: [
                      Image.asset(isSelected==false?"assests/images/img_4.png":"assests/images/img_3.png" , height: 36.h , width: 28.w,),
                      // Icon(Icons.bookmark , size: 50, color: isSelected==false?Color.fromRGBO(81, 79, 79, 1):Color.fromRGBO(247, 181, 57, 1),),
                      Icon(isSelected==false?Icons.add:Icons.check , color: Colors.white,size: 25,)
                    ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}