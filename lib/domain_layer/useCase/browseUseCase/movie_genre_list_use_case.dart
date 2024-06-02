import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/domain_layer/entities/movieDiscoverEntity/movie_discover_entity.dart';

import '../../reposatoryContract/browseRepository/movie_genre_list_repository.dart';

@injectable
class MovieGenreListUseCase {
  @factoryMethod
  MovieGenreListRepository movieGenreListRepository;
  MovieGenreListUseCase({required this.movieGenreListRepository});
  Future<Either<MovieDiscoverEntity, String>> invoke(int withGenre) {
    return movieGenreListRepository.getMovieGenreList(withGenre);
  }
}
