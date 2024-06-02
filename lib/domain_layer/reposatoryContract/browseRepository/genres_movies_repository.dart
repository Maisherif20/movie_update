import 'package:dartz/dartz.dart';
import 'package:untitled/domain_layer/entities/genresEntity/GenresResponseEntity.dart';

abstract class GenresMoviesRepository{
  Future<Either<GenresResponseEntity,String>> getGenresMovies();
}