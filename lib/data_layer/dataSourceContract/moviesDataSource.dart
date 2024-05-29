import 'package:dartz/dartz.dart';
import 'package:untitled/data_layer/models/movieDetailsResponse/DetailsResponse.dart';
import '../models/MoviesResponse/MovieResponse.dart';


abstract class MoviesDataSource {
  Future<Either<MovieResponse, String>> getPopularMovies();
  Future<Either<MovieResponse, String>> getNewReleaseMovies();
  Future<Either<MovieResponse, String>> getRecommendedMovies();
  Future<Either<MovieResponse, String>> getMoreLike(String movieId);
  Future<Either<DetailsResponse, String>> getMoviesDetails(String movieId);
}
