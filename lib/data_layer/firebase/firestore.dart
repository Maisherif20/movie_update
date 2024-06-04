

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../Models/WatchList/movie.dart';

@singleton
@injectable
class Firestore {
  CollectionReference<Movie> getMovieCollection() {
    return FirebaseFirestore.instance.collection("movies").withConverter(
        fromFirestore: (snapshot, options) =>
            Movie.fromFireStore(snapshot.data()),
        toFirestore: (movie, options) => movie.toFireStore());
  }

  Future<bool> addMovieToFirebase(Movie movie, String id) async {
    var movieCollection = getMovieCollection();
    var doc = movieCollection.doc(id);
    var docSnapshot = await doc.get();
    if (docSnapshot.exists) {
      // print('Document already exists');
      return false;
    } else {
      movie.id = id;
      await doc.set(movie);
      return true;
    }
  }



  Future<List<Movie>> getAllMovies() async {
    var movieCollection = getMovieCollection();
    var snapShot = await movieCollection.get();
    return snapShot.docs.map((e) => e.data()).toList();
  }

  Future<bool> updateMovie(Movie movie) async{
    try{
      var movieCollection = getMovieCollection();
     await movieCollection.doc(movie.id).update(movie.toFireStore());
      return true;
    }catch(e){
      return false;
    }
  }

  Stream<List<Movie>> listenForMovie() async* {
    var movieCollection = getMovieCollection();
    var stream = movieCollection.snapshots();
    yield* stream.map(
        (querySnapShot) => querySnapShot.docs.map((e) => e.data()).toList());
  }

  // Future<bool> checkInFireBase(String id) async {
  //   final DocumentSnapshot docSnapshot =
  //       await FirebaseFirestore.instance.collection("movies").doc(id).get();
  //   return docSnapshot.exists;
  // }
//done check if id in firebase.
   Future<bool> checkInFireBase(String id) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('movies')
          .doc(id)
          .get();
      return snapshot.exists;
    } catch (error) {
      print('Error checking ID in Firestore: $error');
      return false;
    }
  }

  Future<bool> deleteMovie(String movieId) async {
    try {
      var movieCollection = getMovieCollection();
      var doc = movieCollection.doc(movieId);
      await doc.delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
