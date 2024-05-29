import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/presentation_layer/ui/tabs/homeTab/movies/recommendedMovies/recommendedItemWidget.dart';
import 'package:untitled/presentation_layer/ui/tabs/homeTab/movies/recommendedMovies/recommendedViewModel.dart';
import '../../../../../../DI/dI.dart';
import '../moviesDetails/detailsScreen.dart';

class RecommendedMovieView extends StatefulWidget {
  const RecommendedMovieView({super.key});

  @override
  State<RecommendedMovieView> createState() => _RecommendedMovieViewState();
}

class _RecommendedMovieViewState extends State<RecommendedMovieView> {
  RecommendedMovieViewModel recommendedMovieViewModel =
      getIt<RecommendedMovieViewModel>();
  @override
  void initState() {
    recommendedMovieViewModel.initPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedMovieViewModel, RecommendedState>(
        bloc: recommendedMovieViewModel,
        builder: (context, state) {
          switch (state) {
            case RecommendedMoviesLoadingState():
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case RecommendedMoviesErrorState():
              {
                return Column(
                  children: [
                    Expanded(child: Text(state.errorMessage)),
                  ],
                );
              }
            case RecommendedMoviesSuccessState():
              {
                var recommendedMovie = state.moviesEntity;
                print(recommendedMovie.resultEntity![0].genreIds![0]);
                return Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 10),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.29,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: recommendedMovie.resultEntity!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: RecommendedItemWidget(
                                  imagePoster: recommendedMovie
                                          .resultEntity![index].posterPath ??
                                      "No image",
                                  id: recommendedMovie.resultEntity![index].id
                                          .toString() ??
                                      "No Id",
                                  title: recommendedMovie
                                          .resultEntity![index].title ??
                                      "No title",
                                  releaseDate: recommendedMovie
                                          .resultEntity![index].releaseDate ??
                                      "No releaseDate",
                                  rate: recommendedMovie
                                          .resultEntity![index].voteAverage
                                          .toString() ??
                                      "No rate", moviesEntity: recommendedMovie, index: index,
                                ),
                              );
                          }),
                    ));
              }
          }
        });
  }
}
