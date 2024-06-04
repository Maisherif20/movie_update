

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/data_layer/firebase/firestore_user.dart';

import '../Models/WatchList/movie.dart';

@singleton
@injectable
class Firestore {
  CollectionReference<Movie> getMovieCollection(String uid) {
    return UserDao.getUserCollection()
        .doc(uid)
        .collection(Movie.collectionName)
        .withConverter(
            fromFirestore: (snapshot, options) =>
                Movie.fromFireStore(snapshot.data()),
            toFirestore: (movie, options) => movie.toFireStore());
    // return FirebaseFirestore.instance.collection("movies").withConverter(
    //     fromFirestore: (snapshot, options) =>
    //         Movie.fromFireStore(snapshot.data()),
    //     toFirestore: (movie, options) => movie.toFireStore());
  }

  Future<bool> addMovieToFirebase(Movie movie, String uid) async {
    var movieCollection = getMovieCollection(uid);
    var doc = movieCollection.doc();
    var docSnapshot = await doc.get();
    // movie.id = doc.id;
    // await doc.set(movie);
    if (docSnapshot.exists) {
      // print('Document already exists');
      return false;
    } else {
      movie.id = doc.id;
      await doc.set(movie);
      return true;
    }
  }
  // Future<bool> addMovieToFirebase(Movie movie, String uid) async {
  //   var movieCollection = getMovieCollection(uid);
  //   var doc = movieCollection.doc(movie.id); // Use the movie's ID as document ID
  //   var docSnapshot = await doc.get();
  //   if (docSnapshot.exists) {
  //     // Document already exists
  //     return false;
  //   } else {
  //     await doc.set(movie); // Set the movie data to Firestore
  //     return true;
  //   }
  // }

  Future<List<Movie>> getAllMovies(String uid) async {
    var movieCollection = getMovieCollection(uid);
    var snapShot = await movieCollection.get();
    return snapShot.docs.map((e) => e.data()).toList();
  }

  Future<bool> updateMovie(Movie movie, String uid) async {
    try {
      var movieCollection = getMovieCollection(uid);
      await movieCollection.doc(movie.id).update(movie.toFireStore());
      return true;
    } catch (e) {
      return false;
    }
  }

  Stream<List<Movie>> listenForMovie(String uid) async* {
    var movieCollection = getMovieCollection(uid);
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

  Future<bool> deleteMovie(String movieId, String uid) async {
    try {
      var movieCollection = getMovieCollection(uid);
      var doc = movieCollection.doc(movieId);
      await doc.delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
