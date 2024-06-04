
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/data_layer/Models/WatchList/movie.dart';
import 'package:untitled/domain_layer/useCase/watchlistUseCase/updateMovieUseCase.dart';



@injectable
class UpdateMovieViewModel extends Cubit<WatchListState> {
  UpdateMovieUseCase updateMovieUseCase;

  @factoryMethod
  UpdateMovieViewModel({required this.updateMovieUseCase,})
      : super(WatchListInitialState());

  updateMovie({required Movie movie, required String uid}) async {
    emit(WatchListLoadingState());
    var result = await updateMovieUseCase.invoke(movie, uid);
    try {
      result.fold((response) {
        emit(WatchListSuccessState(isUpdate: response));
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
  bool isUpdate;
  WatchListSuccessState({required this.isUpdate});
}

class WatchListErrorState extends WatchListState {
  String errorMessage;
  WatchListErrorState({required this.errorMessage});
}
