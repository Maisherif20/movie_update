import 'package:dartz/dartz.dart';

import '../../Models/genresResponse/GenresResponse.dart';

abstract class GenresMoviesDataSource{
  Future<Either<GenresResponse,String>> getGenresMovies();
}