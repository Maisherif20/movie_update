import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/domain_layer/entities/genresEntity/GenresResponseEntity.dart';
import 'package:untitled/domain_layer/useCase/browseUseCase/genres_movies_use_case.dart';

@injectable
class BrowseTabViewModel extends Cubit<BrowseTabState> {
  @factoryMethod
  GenresMoviesUseCase genresMoviesUseCase;
  BrowseTabViewModel({required this.genresMoviesUseCase})
      : super(BrowseTabLoadingState());
  void getGenresMovies() async {
    emit(BrowseTabLoadingState());
    var getGenresMovies = await genresMoviesUseCase.invoke();
    try {
      getGenresMovies.fold((response) {
        emit(BrowseTabSuccessState(genresResponseEntity: response));
      }, (error) {
        emit(BrowseTabErrorState(errorMessage: error));
      });
    } catch (e) {
      emit(BrowseTabErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class BrowseTabState {}

class BrowseTabLoadingState extends BrowseTabState {}

class BrowseTabSuccessState extends BrowseTabState {
  GenresResponseEntity genresResponseEntity;
  BrowseTabSuccessState({required this.genresResponseEntity});
}

class BrowseTabErrorState extends BrowseTabState {
  String errorMessage;
  BrowseTabErrorState({required this.errorMessage});
}
