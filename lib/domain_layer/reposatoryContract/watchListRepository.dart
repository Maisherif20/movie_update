
import 'package:dartz/dartz.dart';

import '../../data_layer/Models/WatchList/movie.dart';


abstract class WatchListRepository{
  Future<Either<bool, String>> addMovieToFireBase(Movie movie, String id);
  Future<Either<List<Movie>, String>> getAllMovies();
  Future<Either<bool, String>> updateMovie(Movie movie);
  Stream<Either<List<Movie>, String>> listenForMovie();
  Future<Either<bool, String>> deleteMovie(String movieId);
  Future<Either<bool, String>> checkInFireBase(String id);
}