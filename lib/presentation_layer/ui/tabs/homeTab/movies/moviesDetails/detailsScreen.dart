import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/DI/dI.dart';
import 'package:untitled/constants/Constant.dart';
import 'package:untitled/data_layer/firebase/firebaseAuth.dart';
import 'package:untitled/presentation_layer/ui/tabs/homeTab/movies/MoreLikeMovies/moreLikeView.dart';
import 'package:untitled/presentation_layer/ui/tabs/homeTab/movies/moviesDetails/detailsViewModel.dart';
import '../../../../../../data_layer/Models/WatchList/movie.dart';
import '../../../../../../domain_layer/entities/DetailsEntity/DetailsEntity.dart';
import '../../../../../../generated/assets.dart';
import '../../../watchListTab/watchListViewModels/addWatchListViewModel.dart';
import '../../../watchListTab/watchListViewModels/updateMovieViewModel.dart';

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
  AddWatchListViewModel addWatchListViewModel = getIt<AddWatchListViewModel>();
  UpdateMovieViewModel updateMovieViewModel = getIt<UpdateMovieViewModel>();
  late SharedPreferences _prefs;

  @override
  void initState() {
    detailsViewModel.movieDetails(widget.id);
    _loadWatchlistState();
    super.initState();
  }

  Future<void> _loadWatchlistState() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      isAddedToWatchlist = _prefs.getBool(widget.id) ??
          false; // Load watchlist state from SharedPreferences
    });
  }

  Future<void> _saveWatchlistState() async {
    await _prefs.setBool(widget.id,
        isAddedToWatchlist); // Save watchlist state to SharedPreferences
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<FirebaseAuthUser>(context, listen: false);
    return Scaffold(
        backgroundColor: Color.fromRGBO(18, 18, 18, 1),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color.fromRGBO(255, 187, 59, 1),
            ),
          ),
          backgroundColor: Colors.black,
          elevation: 0,
          title: Text(
            widget.detailsEntity.title ?? "",
            style: TextStyle(
                color: Color.fromRGBO(255, 187, 59, 1), fontSize: 18),
          ),
        ),
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
                  InkWell(
                    onTap: () async {
                      setState(() {
                        isAddedToWatchlist = !isAddedToWatchlist;
                      });
                      await _saveWatchlistState();
                      if (isAddedToWatchlist) {
                        Movie movie = Movie(
                          id: widget.id,
                          title: widget.detailsEntity.title,
                          posterImagePath: widget.detailsEntity.posterPath,
                          releaseData: widget.detailsEntity.releaseDate,
                          isSelected: true,
                        );
                        // isFav=  await MovieDao.checkInFireBase(movie.id!) ;
                        await addWatchListViewModel.addToWatchList(
                            movie: movie, id: widget.id);
                        await updateMovieViewModel.updateMovie(
                            movie: movie, uid: authProvider.databaseUser!.id!);
                        // await MovieDao.addMovieToFireBase(movie, widget.id);
                        // await MovieDao.updateMovie(movie);
                      }
                    },
                    child: Stack(
                      children: [
                        Image.network(
                          '${Constant.imagePath}${widget.detailsEntity.posterPath}',
                          height: 199.h,
                          width: 129.w,
                        ),
                        Positioned(
                          left: 9.sp,
                          child: isAddedToWatchlist
                              ? Image.asset(
                            Assets.imagesImg5,
                            height: 36,
                            width: 28,
                          )
                              : Image.asset(
                            Assets.imagesImg4,
                            height: 36,
                            width: 28,
                          ),
                        ),
                        Positioned(
                          left: 13.sp,
                          top: 5.sp,
                          child:Icon(
                            isAddedToWatchlist ? Icons.check : Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
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