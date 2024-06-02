import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/data_layer/api_manager/api_manager.dart';
import 'package:untitled/data_layer/dataSourceContract/movies_data_source.dart';
import 'package:untitled/data_layer/models/movieDetailsResponse/DetailsResponse.dart';

import '../models/MoviesResponse/MovieResponse.dart';

@Injectable(as: MoviesDataSource)
class MoviesDataSourceImpl extends MoviesDataSource {
  @factoryMethod
  ApiManager apiManager;
  MoviesDataSourceImpl({required this.apiManager});
  @override
  Future<Either<MovieResponse, String>> getPopularMovies() async {
    try {
      var response = await apiManager.getPopularMovies();
      if (response.statusMsg != null) {
        return Right(response.message!);
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString()); // error from server
    }
  }

  @override
  Future<Either<MovieResponse, String>> getNewReleaseMovies() async {
    try {
      var response = await apiManager.getNewReleaseMovies();
      if (response.statusMsg != null) {
        return Right(response.message!);
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString()); // error from server
    }
  }

  @override
  Future<Either<MovieResponse, String>> getRecommendedMovies() async {
    try {
      var response = await apiManager.getRecommendedMovies();
      if (response.statusMsg != null) {
        return Right(response.message!);
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString()); // error from server
    }
  }

  @override
  Future<Either<DetailsResponse, String>> getMoviesDetails(
      String movieId) async {
    try {
      var response = await apiManager.getMoviesDetails(movieId);
      if (response.statusMsg != null) {
        return Right(response.message!);
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString()); // error from server
    }
  }

  @override
  Future<Either<MovieResponse, String>> getMoreLike(String movieId) async {
    try {
      var response = await apiManager.getMoreLike(movieId);
      if (response.statusMsg != null) {
        return Right(response.message!);
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString()); // error from server
    }
  }
}
