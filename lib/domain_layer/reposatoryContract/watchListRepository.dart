
import 'package:dartz/dartz.dart';

import '../../data_layer/Models/WatchList/movie.dart';


abstract class WatchListRepository {
  Future<Either<bool, String>> addMovieToFireBase(Movie movie, String uid);

  Future<Either<List<Movie>, String>> getAllMovies(String uid);

  Future<Either<bool, String>> updateMovie(Movie movie, String uid);

  Stream<Either<List<Movie>, String>> listenForMovie(String uid);

  Future<Either<bool, String>> deleteMovie(String movieId, String uid);

  Future<Either<bool, String>> checkInFireBase(String id);
}