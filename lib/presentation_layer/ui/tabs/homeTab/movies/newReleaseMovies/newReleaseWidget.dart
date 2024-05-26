import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/constants/Constant.dart';
class NewReleaseWidget extends StatefulWidget {
  //var resultList = snapshot.data?.results;
  String imagePoster;
  String title;
  String releaseDate;
  String id;

  NewReleaseWidget(
      {required this.imagePoster,
        required this.id,
        required this.title,
        required this.releaseDate});

  @override
  State<NewReleaseWidget> createState() => _NewReleaseWidgetState();
}

class _NewReleaseWidgetState extends State<NewReleaseWidget> {
  bool isAddedToWatchlist = false;
  //
  // late SharedPreferences _prefs;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _loadWatchlistState();
  // }
  //
  // Future<void> _loadWatchlistState() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     isAddedToWatchlist = _prefs.getBool(widget.id) ??
  //         false; // Load watchlist state from SharedPreferences
  //   });
  // }

  // Future<void> _saveWatchlistState() async {
  //   await _prefs.setBool(widget.id,
  //       isAddedToWatchlist); // Save watchlist state to SharedPreferences
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => DetailesScreen(id: widget.id)));
      },
      child: Stack(
        // alignment: Alignment.topLeft,
          children: [
            Image.network('${Constant.imagePath}${widget.imagePoster}' ,width: 100.w,),
            InkWell(
              onTap: () async {
                // setState(() {
                //   isAddedToWatchlist = !isAddedToWatchlist;
                // });
                // await _saveWatchlistState();
                // if (isAddedToWatchlist) {
                //   Movie movie = Movie(
                //     id: widget.id,
                //     title: widget.title,
                //     posterImagePath: widget.imagePoster,
                //     releaseData: widget.releaseDate,
                //     isSelected: true,
                //   );
                //   // isFav=  await MovieDao.checkInFireBase(movie.id!) ;
                //   await MovieDao.addMovieToFireBase(movie, widget.id);
                //   await MovieDao.updateMovie(movie);
                // }
              },
              child: Stack(
                children: [
                  isAddedToWatchlist
                      ? Image.asset(
                    "assests/images/img_4.png",
                    height: 36,
                    width: 28,
                  )
                      : Image.asset(
                    "assests/images/img_4.png",
                    height: 36,
                    width: 28,
                  ),
                  // Icon(Icons.bookmark , size: 50, color: moviee.isSelected==false?Color.fromRGBO(81, 79, 79, 1):Color.fromRGBO(247, 181, 57, 1),),
                  Icon(
                    isAddedToWatchlist ? Icons.check : Icons.add,
                    color: Colors.white,
                    size: 25,
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
