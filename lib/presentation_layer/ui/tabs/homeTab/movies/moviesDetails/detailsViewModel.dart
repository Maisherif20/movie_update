import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/domain_layer/entities/DetailsEntity/DetailsEntity.dart';
import 'package:untitled/domain_layer/useCase/moviesDetailsUseCase.dart';


@injectable
class DetailsViewModel extends Cubit<DetailsState> {
  MoviesDetailsUseCase moviesDetailsUseCase;
  @factoryMethod
  DetailsViewModel({required this.moviesDetailsUseCase})
      : super(DetailsLoadingState());
  void movieDetails(String movieId) async {
    emit(DetailsLoadingState());
    var popularMovies = await moviesDetailsUseCase.invoke(movieId);
    try {
      popularMovies.fold((response) {
        emit(DetailsSuccessState(detailsEntity: response));
      }, (error) {
        emit(DetailsErrorState(errorMessage: error));
      });
    } catch (e) {
      emit(DetailsErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class DetailsState {}

class DetailsLoadingState extends DetailsState {}

class DetailsSuccessState extends DetailsState {
  DetailsEntity detailsEntity;
  DetailsSuccessState({required this.detailsEntity});
}
class DetailsErrorState extends DetailsState {
  String errorMessage;
  DetailsErrorState({required this.errorMessage});
}
