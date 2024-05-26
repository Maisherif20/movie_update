import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/domain_layer/useCase/moviesUseCase/newReleaseUseCase.dart';
import 'package:untitled/domain_layer/useCase/moviesUseCase/popularMoviesUseCase.dart';

import '../../../../../../domain_layer/entities/MoviesEntity/MoviesEntity.dart';


@injectable
class PopularMovieViewModel extends Cubit<PopularState> {
  PopularMoviesUseCase popularMoviesUseCase;
  NewReleaseMoviesUseCase newReleaseMoviesUseCase;
  @factoryMethod
  PopularMovieViewModel({required this.popularMoviesUseCase , required this.newReleaseMoviesUseCase})
      : super(LoadingState());
  void initPage() async {
    emit(LoadingState());
    var popularMovies = await popularMoviesUseCase.invoke();
    try {
      popularMovies.fold((response) {
        emit(SuccessState(moviesEntity: response));
      }, (error) {
        emit(ErrorState(errorMessage: error));
      });
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
// void newReleaseMovies() async {
//   emit(LoadingState());
//   var newReleaseMovies = await newReleaseMoviesUseCase.invoke();
//   try {
//     newReleaseMovies.fold((response) {
//       emit(SuccessState(moviesEntity: response));
//     }, (error) {
//       emit(ErrorState(errorMessage: error));
//     });
//   } catch (e) {
//     emit(ErrorState(errorMessage: e.toString()));
//   }
// }
}

sealed class PopularState {}

class LoadingState extends PopularState {}

class SuccessState extends PopularState {
  MoviesEntity moviesEntity;
  SuccessState({required this.moviesEntity});
}
class ErrorState extends PopularState {
  String errorMessage;
  ErrorState({required this.errorMessage});
}
