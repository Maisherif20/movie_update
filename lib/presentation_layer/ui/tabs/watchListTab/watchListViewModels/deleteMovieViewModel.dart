
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/data_layer/Models/WatchList/movie.dart';
import 'package:untitled/domain_layer/useCase/watchlistUseCase/deleteMovieUseCase.dart';

import '../../../../../domain_layer/useCase/watchlistUseCase/addMovieUseCase.dart';


@injectable
class DeleteMovieViewModel extends Cubit<WatchListState> {
  DeleteMovieUseCase deleteMovieUseCase;

  @factoryMethod
  DeleteMovieViewModel({required this.deleteMovieUseCase,})
      : super(WatchListInitialState());

   deleteFromWatchList({required String movieId}) async {
    emit(WatchListLoadingState());
    var result = await deleteMovieUseCase.invoke(movieId);
    try {
      result.fold((response) {
        emit(WatchListSuccessState(isDelete:response));
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
  bool isDelete;
  WatchListSuccessState({required this.isDelete});
}

class WatchListErrorState extends WatchListState {
  String errorMessage;
  WatchListErrorState({required this.errorMessage});
}
