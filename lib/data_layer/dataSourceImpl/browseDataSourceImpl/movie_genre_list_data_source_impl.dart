import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/data_layer/Models/movieDiscoverResponse/MovieDiscoverResponse.dart';
import 'package:untitled/data_layer/api_manager/api_manager.dart';
import 'package:untitled/data_layer/dataSourceContract/browseDataSource/movie_genre_list_data_source.dart';

@Injectable(as: MovieGenreListDataSource)
class MovieGenreListDataSourceImpl extends MovieGenreListDataSource {
  @factoryMethod
  ApiManager apiManager;
  MovieGenreListDataSourceImpl({required this.apiManager});

  @override
  Future<Either<MovieDiscoverResponse, String>> getMovieGenreList(
      int withGenre) async {
    try {
      var response = await apiManager.getMovieGenreList(withGenre);
      if (response.statusMsg != null) {
        return Right(response.message!);
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString());
    }
  }
}
