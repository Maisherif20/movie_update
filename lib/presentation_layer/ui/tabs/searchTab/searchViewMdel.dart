import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/domain_layer/useCase/searchUseCase.dart';
import '../../../../../../domain_layer/entities/MoviesEntity/MoviesEntity.dart';

@injectable
class SearchViewModel extends Cubit<SearchState> {
  SearchUseCase searchUseCase;

  @factoryMethod
  SearchViewModel({required this.searchUseCase}) : super(SearchLoadingState());

  searchForMovie(String query) async {
    emit(SearchLoadingState());
    var search = await searchUseCase.invoke(query);
    try {
      search.fold((response) {
        emit(SearchSuccessState(moviesEntity: response));
      }, (error) {
        emit(SearchErrorState(errorMessage: error));
      });
    } catch (e) {
      emit(SearchErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  MoviesEntity moviesEntity;

  SearchSuccessState({required this.moviesEntity});
}

class SearchErrorState extends SearchState {
  String errorMessage;

  SearchErrorState({required this.errorMessage});
}
