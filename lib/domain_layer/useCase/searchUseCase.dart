import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/domain_layer/reposatoryContract/moviesRepository.dart';

import '../entities/MoviesEntity/MoviesEntity.dart';

@injectable
class SearchUseCase {
  @factoryMethod
  MoviesReposatory moviesReposatory;

  SearchUseCase({required this.moviesReposatory});

  Future<Either<MoviesEntity, String>> invoke(String query) {
    return moviesReposatory.searchForMovie(query);
  }
}
