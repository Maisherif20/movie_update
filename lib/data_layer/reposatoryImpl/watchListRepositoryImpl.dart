import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/data_layer/Models/WatchList/movie.dart';
import 'package:untitled/data_layer/dataSourceContract/watch_list_data_source.dart';

import '../../domain_layer/reposatoryContract/watchListRepository.dart';

@Injectable(as: WatchListRepository)
class WatchListRepositoryImpl extends WatchListRepository {
  @factoryMethod
  WatchListDataSource watchListDataSource;
  WatchListRepositoryImpl({required this.watchListDataSource});

  @override
  Future<Either<bool, String>> addMovieToFireBase(
      Movie movie, String id) async {
    var result = await watchListDataSource.addMovieToFireBase(movie, id);
    return result.fold((response) {
      return left(response);
    }, (error) {
      return right(error);
    });
  }

  @override
  Future<Either<bool, String>> checkInFireBase(String id) async {
    var result = await watchListDataSource.checkInFireBase(id);
    return result.fold((response) {
      return left(response);
    }, (error) {
      return right(error);
    });
  }

  @override
  Future<Either<bool, String>> deleteMovie(String movieId) async {
    var result = await watchListDataSource.deleteMovie(movieId);
    return result.fold((response) {
      return left(response);
    }, (error) {
      return right(error);
    });
  }

  @override
  Future<Either<List<Movie>, String>> getAllMovies() async {
    var result = await watchListDataSource.getAllMovies();
    return result.fold((response) {
      return left(response);
    }, (error) {
      return right(error);
    });
  }

  @override
  Stream<Either<List<Movie>, String>> listenForMovie() async* {
    var result = await watchListDataSource.listenForMovie().first;
    yield result.fold((response) {
      return left(response);
    }, (error) {
      return right(error);
    });
  }

  @override
  Future<Either<bool, String>> updateMovie(Movie movie) async {
    var result = await watchListDataSource.updateMovie(movie);
    return result.fold((response) {
      return left(response);
    }, (error) {
      return right(error);
    });
  }
}
