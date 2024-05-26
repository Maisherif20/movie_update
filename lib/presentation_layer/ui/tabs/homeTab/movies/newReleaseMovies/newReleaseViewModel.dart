import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/domain_layer/useCase/moviesUseCase/newReleaseUseCase.dart';
import '../../../../../../domain_layer/entities/MoviesEntity/MoviesEntity.dart';


@injectable
class NewReleaseMoviesViewModel extends Cubit<NewReleaseState> {
  NewReleaseMoviesUseCase newReleaseMoviesUseCase;
  @factoryMethod
  NewReleaseMoviesViewModel({ required this.newReleaseMoviesUseCase})
      : super(NewReleaseLoadingState());
void newReleaseMovies() async {
  emit(NewReleaseLoadingState());
  var newReleaseMovies = await newReleaseMoviesUseCase.invoke();
  try {
    newReleaseMovies.fold((response) {
      emit(NewReleaseSuccessState(moviesEntity: response));
    }, (error) {
      emit(NewReleaseErrorState(errorMessage: error));
    });
  } catch (e) {
    emit(NewReleaseErrorState(errorMessage: e.toString()));
  }
}
}

sealed class NewReleaseState {}

class NewReleaseLoadingState extends NewReleaseState {}

class NewReleaseSuccessState extends NewReleaseState {
  MoviesEntity moviesEntity;
  NewReleaseSuccessState({required this.moviesEntity});
}
class NewReleaseErrorState extends NewReleaseState {
  String errorMessage;
  NewReleaseErrorState({required this.errorMessage});
}
