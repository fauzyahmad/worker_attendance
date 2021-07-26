import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:worker_attendace/core/model/list_checkin.dart';
import 'package:worker_attendace/core/model/user.dart';
import 'package:worker_attendace/core/service/navigation_service.dart';
import 'package:worker_attendace/locator.dart';
import 'package:worker_attendace/ui/view/auth_screen.dart';

class CheckinService {
  final CollectionReference _listCheckinCollectionReference =
      FirebaseFirestore.instance.collection("list_checkin");
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');
  final NavigationService _navigationService = locator<NavigationService>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future checkinToggle(UserWorker user) async {
    try {
      await _usersCollectionReference.doc(user.id).set(user.toJson());
    } catch (e) {
      inspect(e);
      print(e);
    }
  }

  Future addItemCheckin(
      Map<String, dynamic> listCheckin, UserWorker user) async {
    try {
      await _listCheckinCollectionReference.add(listCheckin);
    } catch (e) {
      inspect(e);
      print(e);
    }
  }

  Future logoutFirebase() async {
    await _firebaseAuth.signOut();
    _navigationService.navigateReplace(AuthScreen.routeName);
  }

  // Future
}
