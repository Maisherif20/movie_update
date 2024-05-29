import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/domain_layer/entities/DetailsEntity/DetailsEntity.dart';
import 'package:untitled/domain_layer/reposatoryContract/moviesReposatory.dart';

@injectable
class MoviesDetailsUseCase{
  @factoryMethod
  MoviesReposatory moviesReposatory;
  MoviesDetailsUseCase({required this.moviesReposatory});
  Future<Either<DetailsEntity , String>>invoke(String movieId){
    return moviesReposatory.getdMoviesDetails(movieId);
  }
}