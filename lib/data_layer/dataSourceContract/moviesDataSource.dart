import 'package:dartz/dartz.dart';
import '../models/MoviesResponse/MovieResponse.dart';


abstract class MoviesDataSource {
  Future<Either<MovieResponse, String>> getPopularMovies();
  Future<Either<MovieResponse, String>> getNewReleaseMovies();
  Future<Either<MovieResponse, String>> getRecommendedMovies();
}
