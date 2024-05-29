import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/domain_layer/reposatoryContract/moviesReposatory.dart';
import '../../entities/MoviesEntity/MoviesEntity.dart';

@injectable
class MoreLikeUseCase{
  @factoryMethod
  MoviesReposatory moviesReposatory;
  MoreLikeUseCase({required this.moviesReposatory});
  Future<Either<MoviesEntity , String>>invoke(String movieId){
    return moviesReposatory.getMoreLike(movieId);
  }
}