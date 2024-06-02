
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/domain_layer/useCase/watchlistUseCase/listenForMovieUseCase.dart';

import '../../../../../data_layer/Models/WatchList/movie.dart';

@injectable
class ListenForMovieViewModel extends Cubit<WatchListState> {
  @factoryMethod

  ListenForMovieViewModel({required this.listenForMovieUseCase})
      : super(WatchListLoadingState());
  ListenForMovieUseCase listenForMovieUseCase;
  void listenForMovie() async {
    emit(WatchListLoadingState());
    try {
      final movieStream = listenForMovieUseCase.invoke();
      await for (final result in movieStream) {
        result.fold(
              (movieList) {
            emit(WatchListSuccessState(movie: movieList));
          },
              (error) {
            emit(WatchListErrorState(errorMessage: error));
          },
        );
      }
    } catch (e) {
      emit(WatchListErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class WatchListState {}

class WatchListLoadingState extends WatchListState {}

class WatchListSuccessState extends WatchListState {
  List<Movie> movie;
  WatchListSuccessState({required this.movie});
}

class WatchListErrorState extends WatchListState {
  String errorMessage;
  WatchListErrorState({required this.errorMessage});
}
