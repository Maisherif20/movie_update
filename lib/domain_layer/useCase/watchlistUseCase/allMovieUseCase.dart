import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data_layer/Models/WatchList/movie.dart';
import '../../reposatoryContract/watchListRepository.dart';
@injectable
class AllMoviesUseCase {
  @factoryMethod
  WatchListRepository watchListRepository;
  AllMoviesUseCase({required this.watchListRepository});
  Future<Either<List<Movie>, String>> invoke() {
    return watchListRepository.getAllMovies();
  }
}