

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain_layer/entities/genresEntity/GenresResponseEntity.dart';
import '../../../domain_layer/reposatoryContract/browseRepository/genres_movies_repository.dart';
import '../../dataSourceContract/browseDataSource/genres_movies_data_source.dart';

@Injectable(as: GenresMoviesRepository)
class GenresMoviesRepositoryImpl extends GenresMoviesRepository {
  @factoryMethod
  GenresMoviesDataSource genresMoviesDataSource;
  GenresMoviesRepositoryImpl({required this.genresMoviesDataSource});
  @override
  Future<Either<GenresResponseEntity, String>> getGenresMovies() async {
    var result = await genresMoviesDataSource.getGenresMovies();
    return result.fold((response) {
      return left(response.toGenresResponseEntity());
    }, (error) {
      return right(error);
    });
  }
}
