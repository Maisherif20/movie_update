import 'package:dartz/dartz.dart';
import 'package:untitled/data_layer/Models/movieDiscoverResponse/MovieDiscoverResponse.dart';

abstract class MovieGenreListDataSource{
  Future<Either<MovieDiscoverResponse,String>> getMovieGenreList(int withGenre);
}