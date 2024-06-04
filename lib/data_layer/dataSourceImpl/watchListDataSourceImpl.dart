import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:untitled/data_layer/Models/WatchList/movie.dart';
import 'package:untitled/data_layer/dataSourceContract/watch_list_data_source.dart';

import '../firebase/firestore.dart';

@Injectable(as: WatchListDataSource)
class WatchListDataSourceImpl extends WatchListDataSource {
  @factoryMethod
  Firestore firestore;
  WatchListDataSourceImpl({required this.firestore});

  @override
  Future<Either<bool, String>> addMovieToFireBase(
      Movie movie, String uid) async {
    try {
      var response = await firestore.addMovieToFirebase(movie, uid);
      return Left(response);
    } catch (e) {
      return Right(e.toString()); // error from server
    }
    // return await firestore.addMovieToFirebase(movie, id);
  }

  @override
  Future<Either<bool, String>> checkInFireBase(String id) async {
    try {
      var response = await firestore.checkInFireBase(id);
      return Left(response);
    } catch (e) {
      return Right(e.toString()); // error from server
    }
  }

  @override
  Future<Either<bool, String>> deleteMovie(String movieId, String uid) async {
    try {
      var response = await firestore.deleteMovie(movieId, uid);
      return Left(response);
    } catch (e) {
      return Right(e.toString()); // error from server
    }
  }

  @override
  Future<Either<List<Movie>, String>> getAllMovies(String uid) async {
    try {
      var response = await firestore.getAllMovies(uid);
      return Left(response);
    } catch (e) {
      return Right(e.toString());
    }
  }

  @override
  Stream<Either<List<Movie>, String>> listenForMovie(String uid) async* {
    try {
      var response = await firestore.listenForMovie(uid).first;
      yield Left(response);
    } catch (e) {
      yield Right(e.toString());
    }
  }

  @override
  Future<Either<bool, String>> updateMovie(Movie movie, String uid) async {
    try {
      var response = await firestore.updateMovie(movie, uid);
      return Left(response);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
