import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/DI/dI.dart';
import 'package:untitled/constants/Constant.dart';

import '../../../../../../data_layer/Models/WatchList/movie.dart';
import '../../../../../../domain_layer/entities/MoviesEntity/MoviesEntity.dart';
import '../../../../../../generated/assets.dart';
import '../../../watchListTab/watchListViewModels/addWatchListViewModel.dart';
import '../../../watchListTab/watchListViewModels/updateMovieViewModel.dart';
import '../moviesDetails/detailsView.dart';

class NewReleaseWidget extends StatefulWidget {
  // ResultEntity resultEntity;
  MoviesEntity moviesEntity;
  int index;

  NewReleaseWidget({required this.moviesEntity, required this.index});

  @override
  State<NewReleaseWidget> createState() => _NewReleaseWidgetState();
}

class _NewReleaseWidgetState extends State<NewReleaseWidget> {
  bool isAddedToWatchlist = false;
  AddWatchListViewModel addWatchListViewModel = getIt<AddWatchListViewModel>();
  UpdateMovieViewModel updateMovieViewModel = getIt<UpdateMovieViewModel>();
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadWatchlistState();
  }

  Future<void> _loadWatchlistState() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      isAddedToWatchlist = _prefs.getBool(
              widget.moviesEntity.resultEntity![widget.index].id.toString()) ??
          false; // Load watchlist state from SharedPreferences
    });
  }

  Future<void> _saveWatchlistState() async {
    await _prefs.setBool(
        widget.moviesEntity.resultEntity![widget.index].id.toString(),
        isAddedToWatchlist); // Save watchlist state to SharedPreferences
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailsView(
                  id: widget.moviesEntity.resultEntity![widget.index].id
                      .toString(),
                  description: widget
                          .moviesEntity.resultEntity![widget.index].overview ??
                      "",
                )));
      },
      child: Stack(
          // alignment: Alignment.topLeft,
          children: [
            Image.network('${Constant.imagePath}${widget.moviesEntity.resultEntity![widget.index].posterPath!}' ,width: 100.w,),
            InkWell(
              onTap: () async {
                setState(() {
                  isAddedToWatchlist = !isAddedToWatchlist;
                });
                await _saveWatchlistState();
                if (isAddedToWatchlist) {
                  Movie movie = Movie(
                    id: widget.moviesEntity.resultEntity![widget.index].id
                        .toString(),
                    title:
                        widget.moviesEntity.resultEntity![widget.index].title,
                    posterImagePath: widget
                        .moviesEntity.resultEntity![widget.index].posterPath,
                    releaseData: widget
                        .moviesEntity.resultEntity![widget.index].releaseDate,
                    isSelected: true,
                  );
                  // isFav=  await MovieDao.checkInFireBase(movie.id!) ;
                  await addWatchListViewModel.addToWatchList(
                      movie: movie,
                      id: widget.moviesEntity.resultEntity![widget.index].id
                          .toString());
                  await updateMovieViewModel.updateMovie(movie: movie);
                }
              },
              child: Stack(
                children: [
                  isAddedToWatchlist
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
