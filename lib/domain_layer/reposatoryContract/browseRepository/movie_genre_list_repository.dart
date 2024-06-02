import 'package:dartz/dartz.dart';
import 'package:untitled/domain_layer/entities/movieDiscoverEntity/movie_discover_entity.dart';

abstract class MovieGenreListRepository{
  Future<Either<MovieDiscoverEntity,String>> getMovieGenreList(int withGenre);
}