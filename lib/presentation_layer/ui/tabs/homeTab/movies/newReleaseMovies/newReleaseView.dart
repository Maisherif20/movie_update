import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/presentation_layer/ui/tabs/homeTab/movies/newReleaseMovies/newReleaseViewModel.dart';
import 'package:untitled/presentation_layer/ui/tabs/homeTab/movies/newReleaseMovies/newReleaseWidget.dart';
import '../../../../../../DI/dI.dart';

class NewReleaseMovieView extends StatefulWidget {
  const NewReleaseMovieView({super.key});

  @override
  State<NewReleaseMovieView> createState() => _NewReleaseMovieViewState();
}

class _NewReleaseMovieViewState extends State<NewReleaseMovieView> {
  NewReleaseMoviesViewModel newReleaseMoviesViewModel = getIt<NewReleaseMoviesViewModel>();
  @override
  void initState() {
    newReleaseMoviesViewModel.newReleaseMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewReleaseMoviesViewModel, NewReleaseState>(
        bloc: newReleaseMoviesViewModel,
        builder: (context, state) {
          switch (state) {
            case NewReleaseLoadingState():
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case NewReleaseErrorState():
              {
                return Column(
                  children: [
                    Expanded(child: Text(state.errorMessage)),
                  ],
                );
              }
            case NewReleaseSuccessState():
              {
                var newReleaseMovie = state.moviesEntity;
                return Padding(
                  padding: const EdgeInsets.only(left: 10 , bottom: 10),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newReleaseMovie.resultEntity!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: NewReleaseWidget(imagePoster: newReleaseMovie.resultEntity![index].posterPath ?? "No image",
                                id: newReleaseMovie.resultEntity![index].id.toString() ?? "No Id",
                                title:newReleaseMovie.resultEntity![index].title ?? "No title" ,
                                releaseDate: newReleaseMovie.resultEntity![index].releaseDate ?? "No releaseDate",
                              ),
                            );
                          })),
                );
              }
          }
        });
  }
}
