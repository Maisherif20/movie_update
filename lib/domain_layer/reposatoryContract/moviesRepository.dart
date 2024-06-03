import 'package:dartz/dartz.dart';
import 'package:untitled/domain_layer/entities/DetailsEntity/DetailsEntity.dart';
import '../entities/MoviesEntity/MoviesEntity.dart';

abstract class MoviesReposatory{
  Future<Either<MoviesEntity , String>> getPopularMovies();
  Future<Either<MoviesEntity , String>> getNewReleaseMovies();
  Future<Either<MoviesEntity , String>> getRecommendedMovies();
  Future<Either<MoviesEntity , String>> getMoreLike(String movieId);
  Future<Either<DetailsEntity, String>> getdMoviesDetails(String movieId);

  Future<Either<MoviesEntity, String>> searchForMovie(String query);
}
