import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/constants/Constant.dart';

class RecommendedItemWidget extends StatefulWidget {
  //var resultList = snapshot.data?.results;
  String imagePoster;
  String title;
  String releaseDate;
  String id;
  String rate;

  RecommendedItemWidget(
      {required this.imagePoster,
      required this.id,
      required this.title,
      required this.releaseDate,
      required this.rate});

  @override
  State<RecommendedItemWidget> createState() => _RecommendedItemWidgetState();
}

class _RecommendedItemWidgetState extends State<RecommendedItemWidget> {
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
      child: Container(
        color: Color.fromRGBO(52, 53, 52, 1),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5 ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                  // alignment: Alignment.topLeft,
                  children: [
                    Image.network(
                      '${Constant.imagePath}${widget.imagePoster}',
                      width: 100.w,
                    ),
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
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color.fromRGBO(255, 187, 59, 1),
                      size: 20,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      widget.rate,
                      style: TextStyle(color: Colors.white , fontSize: 12),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Container(
                    width: 100.w,
                    child: Text(widget.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white , fontSize: 12))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(widget.releaseDate,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white , fontSize: 12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
