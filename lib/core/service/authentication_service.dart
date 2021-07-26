import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:worker_attendace/core/model/user.dart';
import 'package:worker_attendace/core/service/dialog_error.dart';
import 'package:worker_attendace/core/service/firestore_service.dart';
import 'package:worker_attendace/locator.dart';

class AuthenticationService {
  DialogError? _dialogError;
  AuthenticationService() {
    _dialogError = DialogError();
  }
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  UserWorker? _currentUser;

  UserWorker? get currentUser => _currentUser;

  Future loginUser(String email, String password) async {
    try {
      var response = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _populateCurrentUser(response.user);
      return response.user;
    } on FirebaseAuthException catch (e) {
      _dialogError!.showErrorDialog(e.message!);
      print(e.message);
      inspect(e);
      print(e);
    }
  }

  Future signUpUser(String name, String email, String password) async {
    try {
      var response = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // create a new user profile on firestore
      _currentUser = UserWorker(
        id: response.user!.uid,
        email: email,
        name: name,
        password: password,
        checkinStatus: 0,
      );
      await _firestoreService.createUser(_currentUser!);
      print('success register');
      return _currentUser != null;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      _dialogError!.showErrorDialog(e.message!);
      // inspect(e);
      print(e);
    }
  }

  Future<bool> isUserLogIn() async {
    var user = _firebaseAuth.currentUser;
    await _populateCurrentUser(user);
    return user != null;
  }

  Future _populateCurrentUser(User? user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }
}
