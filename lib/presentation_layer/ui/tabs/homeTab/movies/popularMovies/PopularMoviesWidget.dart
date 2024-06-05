import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/constants/Constant.dart';
import '../../../../../../DI/dI.dart';
import '../../../../../../data_layer/Models/WatchList/movie.dart';
import '../../../../../../data_layer/firebase/firebaseAuth.dart';
import '../../../../../../generated/assets.dart';
import '../../../watchListTab/watchListViewModels/addWatchListViewModel.dart';
import '../../../watchListTab/watchListViewModels/checkInViewModel.dart';
import '../../../watchListTab/watchListViewModels/updateMovieViewModel.dart';

class PopularMoviesWidget extends StatefulWidget {
  String title;
  String imagePoster;
  String imageBack;
  String releaseDate;
  String id;

  PopularMoviesWidget(
      {required this.title, required this.imagePoster, required this.releaseDate, required this.imageBack, required this.id,});

  @override
  State<PopularMoviesWidget> createState() => _PopularMoviesWidgetState();
}

class _PopularMoviesWidgetState extends State<PopularMoviesWidget> {
  bool isAddedToWatchlist = false;
  CheckInViewModel checkInViewModel = getIt<CheckInViewModel>();
  AddWatchListViewModel addWatchListViewModel = getIt<AddWatchListViewModel>();
  UpdateMovieViewModel updateMovieViewModel = getIt<UpdateMovieViewModel>();

  //
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadWatchlistState();
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
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(18, 18, 18, 1),
      ),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
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
                     // bool isExist = await Firestore.checkInFireBasetwo(widget.id);
                     //  if(isExist == false) {
                     //    setState(() {
                     //      isAddedToWatchlist =false;
                     //    });
                     //  }
                     //  print("hereeeeeeeeeeee$isExist");
                      print(widget.id);
                      setState(() {
                        isAddedToWatchlist = !isAddedToWatchlist;
                      });
                      await _saveWatchlistState();
                      if (isAddedToWatchlist) {
                        Movie movie = Movie(
                          id: widget.id,
                          title: widget.title,
                          posterImagePath: widget.imagePoster,
                          releaseData: widget.releaseDate,
                          isSelected: true,
                        );

                        await addWatchListViewModel.addToWatchList(
                            movie: movie, id: authProvider.databaseUser!.id!);

                        // await MovieDao.addMovieToFireBase(movie, widget.id);
                        await updateMovieViewModel.updateMovie(
                            movie: movie, uid: authProvider.databaseUser!.id!);
                        // await MovieDao.updateMovie(movie);

                        print(isAddedToWatchlist);
                      }
                    },
                    child: Stack(children: [
                      Image.asset(
                        isAddedToWatchlist
                            ? Assets.imagesImg5
                            : Assets.imagesImg4,
                        height: 36.h,
                        width: 28.w,
                      ),
                      // Icon(Icons.bookmark , size: 50, color: isSelected==false?Color.fromRGBO(81, 79, 79, 1):Color.fromRGBO(247, 181, 57, 1),),
                      Icon(
                        isAddedToWatchlist ? Icons.check : Icons.add,
                        color: Colors.white,
                        size: 25,
                      )
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