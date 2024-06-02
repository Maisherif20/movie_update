import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/data_layer/Models/genresResponse/GenresResponse.dart';
import 'package:untitled/data_layer/api_manager/api_manager.dart';
import 'package:untitled/data_layer/dataSourceContract/browseDataSource/genres_movies_data_source.dart';

@Injectable(as: GenresMoviesDataSource)
class GenresMoviesDataSourceImpl extends GenresMoviesDataSource {
  @factoryMethod
  ApiManager apiManager;
  GenresMoviesDataSourceImpl({required this.apiManager});

  @override
  Future<Either<GenresResponse, String>> getGenresMovies() async {
    try {
      var response = await apiManager.getGenresMovies();
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
