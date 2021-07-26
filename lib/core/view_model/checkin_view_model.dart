import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worker_attendace/core/model/list_checkin.dart';
import 'package:worker_attendace/core/model/user.dart';
import 'package:worker_attendace/core/service/checkin_service.dart';
import 'package:worker_attendace/core/service/firestore_service.dart';
import 'package:worker_attendace/locator.dart';

class CheckInViewModel extends ChangeNotifier {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final CheckinService _checkinService = locator<CheckinService>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserWorker? currentUser;
  // List<ListCheckin> _listCheckin = [];

  // List<ListCheckin> get listCheckin {
  //   return [..._listCheckin];
  // }

  Future getCurrentUser() async {
    var user = _firebaseAuth.currentUser;
    currentUser = await _firestoreService.getUser(user!.uid);
    notifyListeners();
  }

  void changeCheckinStatus(int checkinStatus) async {
    UserWorker newUserWorker = UserWorker(
      id: currentUser!.id,
      email: currentUser!.email,
      name: currentUser!.name,
      password: currentUser!.password,
      checkinStatus: checkinStatus,
      //checkin status 1 = on, checkin status 2 = off
      //checkin status 0 = none/new user
    );
    await _checkinService.checkinToggle(newUserWorker);
    currentUser = newUserWorker;
    notifyListeners();
  }

  void addItemCheckin(
    Map<String, dynamic> listCheckin,
    String checkingOut,
    UserWorker user,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(user.id)) {
      final listCheckinNew = json.encode(listCheckin);
      await prefs.setString(user.id, listCheckinNew);
      // prefs.clear();
    } else {
      // prefs.remove(user.id);
      var extractedData = json.decode(prefs.getString(user.id)!);
      DateTime checkingInCache = DateTime.parse(extractedData['checkingIn']);
      Map<String, dynamic> listNewCheckin = {
        ...listCheckin,
        'checkingIn': extractedData['checkingIn'],
        'checkingOut': checkingOut,
        'workingTime':
            '${DateTime.parse(checkingOut).difference(checkingInCache).inHours} Jam, '
                '${DateTime.parse(checkingOut).difference(checkingInCache).inMinutes} Menit',
      };
      prefs.remove(user.id);
      await _checkinService.addItemCheckin(listNewCheckin, user);
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    await _checkinService.logoutFirebase();
  }
}
