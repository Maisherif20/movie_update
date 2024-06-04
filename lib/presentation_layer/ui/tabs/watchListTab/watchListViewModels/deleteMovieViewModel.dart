
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/data_layer/Models/WatchList/movie.dart';
import 'package:untitled/domain_layer/useCase/watchlistUseCase/deleteMovieUseCase.dart';

import '../../../../../domain_layer/useCase/watchlistUseCase/addMovieUseCase.dart';


@injectable
class DeleteMovieViewModel extends Cubit<DeleteWatchListState> {
  DeleteMovieUseCase deleteMovieUseCase;

  @factoryMethod
  DeleteMovieViewModel({required this.deleteMovieUseCase,})
      : super(DeleteWatchListInitialState());

   deleteFromWatchList({required String movieId, required String uid}) async {
    emit(DeleteWatchListLoadingState());
    var result = await deleteMovieUseCase.invoke(movieId, uid);
    try {
      result.fold((response) {
        emit(DeleteWatchListSuccessState(isDelete: response));
      }, (error) {
        emit(DeleteWatchListErrorState(errorMessage: error));
      });
    } catch (e) {
      emit(DeleteWatchListErrorState(errorMessage: e.toString()));
    }
  }

}

sealed class DeleteWatchListState {}

class DeleteWatchListInitialState extends DeleteWatchListState {}

class DeleteWatchListLoadingState extends DeleteWatchListState {}

class DeleteWatchListSuccessState extends DeleteWatchListState {
  bool isDelete;
  DeleteWatchListSuccessState({required this.isDelete});
}

class DeleteWatchListErrorState extends DeleteWatchListState {
  String errorMessage;
  DeleteWatchListErrorState({required this.errorMessage});
}
