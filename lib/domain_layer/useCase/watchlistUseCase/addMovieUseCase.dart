import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data_layer/Models/WatchList/movie.dart';
import '../../reposatoryContract/watchListRepository.dart';

@injectable
class AddMovieUseCase {
  @factoryMethod
  WatchListRepository watchListRepository;

  AddMovieUseCase({required this.watchListRepository});

  Future<Either<bool, String>> invoke(Movie movie, String uid) {
    return watchListRepository.addMovieToFireBase(movie, uid);
  }
}







