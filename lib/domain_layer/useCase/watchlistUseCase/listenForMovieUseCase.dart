import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data_layer/Models/WatchList/movie.dart';
import '../../reposatoryContract/watchListRepository.dart';
@injectable
class ListenForMovieUseCase {
  @factoryMethod
  WatchListRepository watchListRepository;

  ListenForMovieUseCase({required this.watchListRepository});

  Stream<Either<List<Movie>, String>> invoke(String uid) {
    return watchListRepository.listenForMovie(uid);
  }
}