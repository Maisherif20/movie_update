import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/domain_layer/useCase/watchlistUseCase/allMovieUseCase.dart';

import '../../../../../data_layer/Models/WatchList/movie.dart';
@injectable
class AllMoviesViewModel extends Cubit<WatchListState> {
  AllMoviesUseCase allMoviesUseCase;

  @factoryMethod
  AllMoviesViewModel({required this.allMoviesUseCase})
      : super(WatchListInitialState());

  getAllMoviesInWatchList({required String uid}) async {
    emit(WatchListLoadingState());
    var result = await allMoviesUseCase.invoke(uid);
    try {
      result.fold((response) {
        emit(WatchListSuccessState(movie: response));
      }, (error) {
        emit(WatchListErrorState(errorMessage: error));
      });
    } catch (e) {
      emit(WatchListErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class WatchListState {}

class WatchListInitialState extends WatchListState {}

class WatchListLoadingState extends WatchListState {}

class WatchListSuccessState extends WatchListState {
  List<Movie> movie;
  WatchListSuccessState({required this.movie});
}

class WatchListErrorState extends WatchListState {
  String errorMessage;
  WatchListErrorState({required this.errorMessage});
}
