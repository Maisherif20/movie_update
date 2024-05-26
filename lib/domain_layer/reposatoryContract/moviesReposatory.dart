import 'package:dartz/dartz.dart';
import '../entities/MoviesEntity/MoviesEntity.dart';

abstract class MoviesReposatory{
  Future<Either<MoviesEntity , String>> getPopularMovies();
  Future<Either<MoviesEntity , String>> getNewReleaseMovies();
  Future<Either<MoviesEntity , String>> getRecommendedMovies();
}
