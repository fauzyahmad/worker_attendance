import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:worker_attendace/core/model/user.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

  Future createUser(UserWorker user) async {
    try {
      await _usersCollectionReference.doc(user.id).set(user.toJson());
    } catch (e) {
      inspect(e);
      print(e);
    }
  }

  Future<UserWorker?> getUser(String uid) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userResponse =
          await _usersCollectionReference.doc(uid).get()
              as DocumentSnapshot<Map<String, dynamic>>;
      return UserWorker.fromJson(userResponse.data()!);
    } catch (e) {
      inspect(e);
      print(e);
      return null;
    }
  }
}
