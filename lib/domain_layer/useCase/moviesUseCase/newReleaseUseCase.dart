import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/domain_layer/reposatoryContract/moviesReposatory.dart';

import '../../entities/MoviesEntity/MoviesEntity.dart';

@injectable
class NewReleaseMoviesUseCase{
  @factoryMethod
  MoviesReposatory moviesReposatory;
  NewReleaseMoviesUseCase({required this.moviesReposatory});
  Future<Either<MoviesEntity , String>>invoke(){
    return moviesReposatory.getNewReleaseMovies();
  }

}