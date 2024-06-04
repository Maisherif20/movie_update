import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../reposatoryContract/watchListRepository.dart';
@injectable
class DeleteMovieUseCase {
  @factoryMethod
  WatchListRepository watchListRepository;

  DeleteMovieUseCase({required this.watchListRepository});

  Future<Either<bool, String>> invoke(String movieId, String uid) {
    return watchListRepository.deleteMovie(movieId, uid);
  }
}
