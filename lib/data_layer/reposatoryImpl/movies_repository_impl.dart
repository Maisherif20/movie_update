import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/data_layer/dataSourceContract/movies_data_source.dart';
import 'package:untitled/domain_layer/entities/DetailsEntity/DetailsEntity.dart';
import 'package:untitled/domain_layer/reposatoryContract/moviesRepository.dart';

import '../../domain_layer/entities/MoviesEntity/MoviesEntity.dart';
@Injectable(as:MoviesReposatory)
class MoviesReposatoryImpl extends MoviesReposatory{
  @factoryMethod
  MoviesDataSource moviesDataSource;
  MoviesReposatoryImpl({required this.moviesDataSource});
  @override
  Future<Either<MoviesEntity, String>> getPopularMovies() async{
    var result = await moviesDataSource.getPopularMovies();
    return result.fold((response) {
      return left(response.toMoviesEntity());
    }, (error) {
      return right(error);
    });
  }

  @override
  Future<Either<MoviesEntity, String>> getNewReleaseMovies() async{
    var result = await moviesDataSource.getNewReleaseMovies();
    return result.fold((response) {
      return left(response.toMoviesEntity());
    }, (error) {
      return right(error);
    });
  }

  @override
  Future<Either<MoviesEntity, String>> getRecommendedMovies() async{
    var result = await moviesDataSource.getRecommendedMovies();
    return result.fold((response) {
      return left(response.toMoviesEntity());
    }, (error) {
      return right(error);
    });
  }

  @override
  Future<Either<DetailsEntity, String>> getdMoviesDetails(String movieId) async{
    var result = await moviesDataSource.getMoviesDetails(movieId);
    return result.fold((response) {
      return left(response.toDetailsEntity());
    }, (error) {
      return right(error);
    });
  }

  @override
  Future<Either<MoviesEntity, String>> getMoreLike(String movieId) async {
    var result = await moviesDataSource.getMoreLike(movieId);
    return result.fold((response) {
      return left(response.toMoviesEntity());
    }, (error) {
      return right(error);
    });
  }

  @override
  Future<Either<MoviesEntity, String>> searchForMovie(String query) async {
    var result = await moviesDataSource.searchForMovie(query);
    return result.fold((response) {
      return left(response.toMoviesEntity());
    }, (error) {
      return right(error);
    });
  }
}