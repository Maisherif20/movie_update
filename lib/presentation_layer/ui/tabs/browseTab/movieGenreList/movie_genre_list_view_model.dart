import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/domain_layer/entities/movieDiscoverEntity/movie_discover_entity.dart';
import 'package:untitled/domain_layer/useCase/browseUseCase/movie_genre_list_use_case.dart';

@injectable
class MovieGenreListViewModel extends Cubit<MovieGenreListState> {
  @factoryMethod
  MovieGenreListUseCase movieGenreListUseCase;
  MovieGenreListViewModel({required this.movieGenreListUseCase})
      : super(MovieGenreListLoadingState());
  void getMovieGenreList(int withGenre) async {
    emit(MovieGenreListLoadingState());
    var getGenresMovies = await movieGenreListUseCase.invoke(withGenre);
    try {
      getGenresMovies.fold((response) {
        emit(MovieGenreListSuccessState(movieDiscoverEntity: response));
      }, (error) {
        emit(MovieGenreListErrorState(errorMessage: error));
      });
    } catch (e) {
      emit(MovieGenreListErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class MovieGenreListState {}

class MovieGenreListLoadingState extends MovieGenreListState {}

class MovieGenreListSuccessState extends MovieGenreListState {
  MovieDiscoverEntity movieDiscoverEntity;
  MovieGenreListSuccessState({required this.movieDiscoverEntity});
}

class MovieGenreListErrorState extends MovieGenreListState {
  String errorMessage;
  MovieGenreListErrorState({required this.errorMessage});
}
