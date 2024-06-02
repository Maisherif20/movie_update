
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/domain_layer/entities/genresEntity/GenresResponseEntity.dart';

import '../../reposatoryContract/browseRepository/genres_movies_repository.dart';
@injectable
class GenresMoviesUseCase{
  @factoryMethod
 GenresMoviesRepository genresMoviesRepository;
  GenresMoviesUseCase({required this.genresMoviesRepository});
  Future<Either<GenresResponseEntity,String>> invoke(){
    return genresMoviesRepository.getGenresMovies();
  }
}