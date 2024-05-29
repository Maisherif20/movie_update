import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/domain_layer/useCase/moviesUseCase/moreLikeUseCase.dart';
import '../../../../../../domain_layer/entities/MoviesEntity/MoviesEntity.dart';

@injectable
class MoreLikeViewModel extends Cubit<MoreLikeState> {
  MoreLikeUseCase moreLikeUseCase;
  @factoryMethod
  MoreLikeViewModel({required this.moreLikeUseCase})
      : super(MoreLikeLoadingState());
  getMoreLike(String movieId) async {
    emit(MoreLikeLoadingState());
    var moreLike = await moreLikeUseCase.invoke(movieId);
    try {
      moreLike.fold((response) {
        emit(MoreLikeSuccessState(moviesEntity: response));
      }, (error) {
        emit(MoreLikeErrorState(errorMessage: error));
      });
    } catch (e) {
      emit(MoreLikeErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class MoreLikeState {}

class MoreLikeLoadingState extends MoreLikeState {}

class MoreLikeSuccessState extends MoreLikeState {
  MoviesEntity moviesEntity;
  MoreLikeSuccessState({required this.moviesEntity});
}

class MoreLikeErrorState extends MoreLikeState {
  String errorMessage;
  MoreLikeErrorState({required this.errorMessage});
}
