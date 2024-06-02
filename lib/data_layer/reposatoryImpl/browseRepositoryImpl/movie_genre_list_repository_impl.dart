
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain_layer/entities/movieDiscoverEntity/movie_discover_entity.dart';
import '../../../domain_layer/reposatoryContract/browseRepository/movie_genre_list_repository.dart';
import '../../dataSourceContract/browseDataSource/movie_genre_list_data_source.dart';

@Injectable(as: MovieGenreListRepository)
class MovieGenreLIstRepositoryImpl extends MovieGenreListRepository {
  @factoryMethod
  MovieGenreListDataSource movieGenreListDataSource;
  MovieGenreLIstRepositoryImpl({required this.movieGenreListDataSource});
  @override
  Future<Either<MovieDiscoverEntity, String>> getMovieGenreList(
      int withGenre) async {
    var result = await movieGenreListDataSource.getMovieGenreList(withGenre);
    return result.fold((response) {
      return left(response.toMovieDiscoverEntity());
    }, (error) {
      return right(error);
    });
  }
}
