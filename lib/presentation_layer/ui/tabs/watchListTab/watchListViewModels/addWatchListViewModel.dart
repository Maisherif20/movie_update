
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/data_layer/Models/WatchList/movie.dart';

import '../../../../../domain_layer/useCase/watchlistUseCase/addMovieUseCase.dart';


@injectable
class AddWatchListViewModel extends Cubit<WatchListState> {
  AddMovieUseCase addMovieUseCase;

  @factoryMethod
  AddWatchListViewModel({required this.addMovieUseCase,})
      : super(WatchListInitialState());

   addToWatchList({required Movie movie, required String id}) async {
    emit(WatchListLoadingState());
    var result = await addMovieUseCase.invoke(movie, id);
    try {
      result.fold((response) {
        emit(WatchListSuccessState(isAdd:response));
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
  bool isAdd;
  WatchListSuccessState({required this.isAdd});
}

class WatchListErrorState extends WatchListState {
  String errorMessage;
  WatchListErrorState({required this.errorMessage});
}
