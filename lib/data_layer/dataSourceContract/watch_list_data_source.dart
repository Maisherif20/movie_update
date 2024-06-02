import 'package:dartz/dartz.dart';
import '../Models/WatchList/movie.dart';


abstract class WatchListDataSource {
  Future<Either<bool, String>> addMovieToFireBase(Movie movie, String id);
  Future<Either<List<Movie>, String>> getAllMovies();
  Future<Either<bool, String>> updateMovie(Movie movie);
  // Stream<List<Movie>> listenForMovie();
  Stream<Either<List<Movie>, String>> listenForMovie();
  Future<Either<bool, String>> deleteMovie(String movieId);
  Future<Either<bool, String>> checkInFireBase(String id);
  // Future<Either<Movie, String>> getAllMovies();
  // Future<Either<Movie, String>> updateMovie(Movie movie);
  // Stream<Either<Movie, String>> listenForMovie();
  // Future<Either<Movie, String>> deleteMovie(String movieId);
  // Future<Either<Movie, String>> checkInFireBase(String id);
  // Future<Either<void, String>> addMovieToFireBase(Movie movie, String id);

}
