import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/account/user.dart';

class UserDao {
  static CollectionReference<User> getUserCollection() {
    return FirebaseFirestore.instance.collection('users').withConverter<User>(
        fromFirestore: (snapshot, options) =>
            User.fromFireStore(snapshot.data()),
        toFirestore: (user, options) => user.toFireStore());
  }

  static Future<void> addUser(User user) {
    var usersCollection = getUserCollection();
    var doc = usersCollection.doc(user.id);
    return doc.set(user);
  }

  static Future<User?> getUser(String uid) async {
    var usersCollection = getUserCollection();
    var doc = usersCollection.doc(uid);
    var docSnapshot = await doc.get();
    return docSnapshot.data();
  }
}
