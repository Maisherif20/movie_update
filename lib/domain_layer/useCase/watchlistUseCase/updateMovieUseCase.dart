import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data_layer/Models/WatchList/movie.dart';
import '../../reposatoryContract/watchListRepository.dart';
@injectable
class UpdateMovieUseCase {
  @factoryMethod
  WatchListRepository watchListRepository;
  UpdateMovieUseCase({required this.watchListRepository});
  Future<Either<bool, String>> invoke(Movie movie) {
    return watchListRepository.updateMovie(movie);
  }
}