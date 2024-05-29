import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/presentation_layer/ui/tabs/homeTab/movies/moviesDetails/detailsView.dart';
import 'package:untitled/presentation_layer/ui/tabs/homeTab/movies/popularMovies/PopularMoviesWidget.dart';
import 'package:untitled/presentation_layer/ui/tabs/homeTab/movies/popularMovies/popularMovieViewModel.dart';
import '../../../../../../DI/dI.dart';
import '../moviesDetails/detailsScreen.dart';


class PopularMovieView extends StatefulWidget {
  const PopularMovieView({super.key});

  @override
  State<PopularMovieView> createState() => _PopularMovieViewState();
}

class _PopularMovieViewState extends State<PopularMovieView> {
  PopularMovieViewModel popularMovieViewModel = getIt<PopularMovieViewModel>();
  @override
  void initState() {
    popularMovieViewModel.initPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMovieViewModel, PopularState>(
        bloc: popularMovieViewModel,
        builder: (context, state) {
          switch (state) {
            case LoadingState():
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case ErrorState():
              {
                return Column(
                  children: [
                    Expanded(child: Text(state.errorMessage)),
                  ],
                );
              }
            case SuccessState():
              {
                var popularMovie = state.moviesEntity;
                return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: popularMovie.resultEntity!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailsView(id: popularMovie.resultEntity![index].id.toString(), description: popularMovie.resultEntity![index].overview ??"",)));
                            },
                            child: PopularMoviesWidget(
                              title: popularMovie.resultEntity![index].title ??
                                  "No Title",
                              imagePoster: popularMovie
                                      .resultEntity![index].posterPath ??
                                  "No posterPath",
                              releaseDate: popularMovie
                                      .resultEntity![index].releaseDate ??
                                  "No releaseDate",
                              imageBack: popularMovie
                                      .resultEntity![index].backdropPath ??
                                  "No releaseDate",
                            ),
                          );
                        }));
              }
          }
        });
  }
}
