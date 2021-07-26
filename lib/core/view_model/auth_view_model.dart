import 'package:flutter/widgets.dart';
import 'package:worker_attendace/core/model/user.dart';
import 'package:worker_attendace/core/service/authentication_service.dart';
import 'package:worker_attendace/core/service/firestore_service.dart';
import 'package:worker_attendace/core/service/navigation_service.dart';
import 'package:worker_attendace/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:worker_attendace/ui/view/homescreen.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  UserWorker? currentUser;

  Future login(String email, String password) async {
    print('ini email dan pass $email $password');
    User result = await _authenticationService.loginUser(email, password);
    currentUser = await _firestoreService.getUser(result.uid);
    notifyListeners();
    _navigationService.navigateReplace(HomeScreen.routeName);
  }

  Future signUp(String email, String password, String name) async {
    var result = await _authenticationService.signUpUser(name, email, password);
    if (result) {
      login(email, password);
    }
  }

  // void checkIfLogin(User user) {}
}
