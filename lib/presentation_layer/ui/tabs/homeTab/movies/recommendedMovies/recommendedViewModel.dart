import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/domain_layer/useCase/moviesUseCase/recommendedMoviesUseCase.dart';
import '../../../../../../domain_layer/entities/MoviesEntity/MoviesEntity.dart';


@injectable
class RecommendedMovieViewModel extends Cubit<RecommendedState> {
  RecommendedMoviesUseCase recommendedMoviesUseCase;
  @factoryMethod
  RecommendedMovieViewModel({required this.recommendedMoviesUseCase})
      : super(RecommendedMoviesLoadingState());
  void initPage() async {
    emit(RecommendedMoviesLoadingState());
    var popularMovies = await recommendedMoviesUseCase.invoke();
    try {
      popularMovies.fold((response) {
        emit(RecommendedMoviesSuccessState(moviesEntity: response));
      }, (error) {
        emit(RecommendedMoviesErrorState(errorMessage: error));
      });
    } catch (e) {
      emit(RecommendedMoviesErrorState(errorMessage: e.toString()));
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

sealed class RecommendedState {}

class RecommendedMoviesLoadingState extends RecommendedState {}

class RecommendedMoviesSuccessState extends RecommendedState {
  MoviesEntity moviesEntity;
  RecommendedMoviesSuccessState({required this.moviesEntity});
}
class RecommendedMoviesErrorState extends RecommendedState {
  String errorMessage;
  RecommendedMoviesErrorState({required this.errorMessage});
}
