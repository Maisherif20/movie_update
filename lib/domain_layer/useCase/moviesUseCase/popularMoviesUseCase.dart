import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/domain_layer/reposatoryContract/moviesReposatory.dart';

import '../../entities/MoviesEntity/MoviesEntity.dart';

@injectable
class PopularMoviesUseCase{
  @factoryMethod
  MoviesReposatory moviesReposatory;
  PopularMoviesUseCase({required this.moviesReposatory});
  Future<Either<MoviesEntity , String>>invoke(){
    return moviesReposatory.getPopularMovies();
  }

}