

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/domain_layer/useCase/watchlistUseCase/checkForMovieUseCase.dart';

@injectable
class CheckInViewModel extends Cubit<WatchListState> {
  CheckInFireBaseUseCase checkInFireBaseUseCase;

  @factoryMethod

  CheckInViewModel({required this.checkInFireBaseUseCase})
      : super(WatchListInitialState());
  checkInFirebase({required String id}) async {
    emit(WatchListLoadingState());
    var result = await checkInFireBaseUseCase.invoke(id);
    try {
      result.fold((response) {
        emit(WatchListSuccessState(isExist: response));
      }, (error) {
        emit(WatchListErrorState(errorMessage: error));
      });
    }catch (e) {
      emit(WatchListErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class WatchListState {}

class WatchListInitialState extends WatchListState {}

class WatchListLoadingState extends WatchListState {}

class WatchListSuccessState extends WatchListState {
  bool isExist ;
  WatchListSuccessState({required this.isExist});
}

class WatchListErrorState extends WatchListState {
  String errorMessage;
  WatchListErrorState({required this.errorMessage});
}
