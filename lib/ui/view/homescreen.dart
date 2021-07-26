import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worker_attendace/core/view_model/checkin_view_model.dart';
import 'package:worker_attendace/ui/widget/custom_button.dart';
import 'package:worker_attendace/ui/widget/detail_checkin.dart';
import '../../core/utils/constants.dart' as Constants;

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loadingData = false;
  @override
  void initState() {
    refreshDataUser();
    super.initState();
  }

  void refreshDataUser() async {
    setState(() {
      _loadingData = true;
    });
    await Provider.of<CheckInViewModel>(context, listen: false)
        .getCurrentUser();
    setState(() {
      _loadingData = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // padding: Constants.paddingContent,
        physics: ScrollPhysics(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Consumer<CheckInViewModel>(
                  builder: (_, checkin, __) => Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 40, bottom: 5),
                    height: 250,
                    color: Color(0xFFE8F4FF),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Selamat Datang,',
                                    style: theme.textTheme.caption!.copyWith(
                                      color: Color(0xFF868686),
                                    ),
                                  ),
                                  Text(
                                    _loadingData
                                        ? ''
                                        : checkin.currentUser!.name,
                                    style: theme.textTheme.headline6!.copyWith(
                                      color: Color(0xFF393939),
                                    ),
                                  ),
                                ],
                              ),
                              CustomButton(
                                texts: [
                                  Text(
                                    'Logout',
                                    style: theme.textTheme.button!.copyWith(
                                      color: theme.primaryColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                                onPressed: () {
                                  checkin.logout();
                                },
                                fillColor: Color(0xFFE8F4FF),
                                borderColor: theme.primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7.5,
                ),
                ListCheckinWidget(),
              ],
            ),
            Positioned(
              top: 100,
              child: Wrap(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFC9D1D9).withOpacity(.4),
                          offset: Offset(0, 4),
                          blurRadius: 14,
                          spreadRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Consumer<CheckInViewModel>(
                      builder: (_, checkin, __) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Status Absensi',
                              style: theme.textTheme.headline6!.copyWith(
                                color: Constants.black01,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                _loadingData
                                    ? ''
                                    : (checkin.currentUser!.checkinStatus == 0
                                        ? 'Belum Absen'
                                        : (checkin.currentUser!.checkinStatus ==
                                                1
                                            ? 'Absen In'
                                            : 'Absen Out')),
                                style: theme.textTheme.headline4!.copyWith(
                                  color: _loadingData
                                      ? Colors.white
                                      : checkin.currentUser!.checkinStatus == 0
                                          ? Constants.black01
                                          : (checkin.currentUser!
                                                      .checkinStatus ==
                                                  1
                                              ? Colors.green
                                              : Colors.red),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              InkWell(
                                onTap: () {
                                  Map<String, dynamic> listCheckin = {
                                    'name': checkin.currentUser!.name,
                                    'date': DateTime.now().toIso8601String(),
                                    'checkingIn':
                                        DateTime.now().toIso8601String(),
                                    'checkingOut':
                                        DateTime.now().toIso8601String(),
                                    'workingTime':
                                        DateTime.now().toIso8601String(),
                                  };
                                  if (checkin.currentUser!.checkinStatus == 0 ||
                                      checkin.currentUser!.checkinStatus == 2) {
                                    checkin.changeCheckinStatus(1);
                                    checkin.addItemCheckin(
                                        listCheckin,
                                        DateTime.now().toIso8601String(),
                                        checkin.currentUser!);
                                  } else {
                                    checkin.changeCheckinStatus(2);
                                    checkin.addItemCheckin(
                                        listCheckin,
                                        DateTime.now().toIso8601String(),
                                        checkin.currentUser!);
                                  }

                                  checkin.addItemCheckin(
                                      listCheckin,
                                      DateTime.now().toIso8601String(),
                                      checkin.currentUser!);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 3,
                                      color: _loadingData
                                          ? Colors.white
                                          : checkin.currentUser!
                                                          .checkinStatus ==
                                                      0 ||
                                                  checkin.currentUser!
                                                          .checkinStatus ==
                                                      2
                                              ? Colors.red
                                              : Colors.green,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.fingerprint,
                                    size: 40,
                                    color: _loadingData
                                        ? Colors.white
                                        : checkin.currentUser!.checkinStatus ==
                                                    0 ||
                                                checkin.currentUser!
                                                        .checkinStatus ==
                                                    2
                                            ? Colors.red
                                            : Colors.green,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              '*Tekan tombol fingerprint untuk absensi.',
                              style: theme.textTheme.caption!.copyWith(
                                color: Constants.black01,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListCheckinWidget extends StatelessWidget {
  const ListCheckinWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: Constants.paddingContent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daftar Absensi Pegawai',
            style: theme.textTheme.headline6!.copyWith(
              color: Color(0xFF101010),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("list_checkin")
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data!.docs[index];
                    return SizedBox(
                      height: 100,
                      child: DetailCheckin(
                        name: ds['name'],
                        date: Constants.formatDate
                            .format(DateTime.parse(ds['date'])),
                        workingTime: ds['workingTime'],
                        checkingIn: Constants.timeFormat
                            .format(DateTime.parse(ds['checkingIn'])),
                        checkingOut: Constants.timeFormat
                            .format(DateTime.parse(ds['checkingIn'])),
                      ),
                    );
                  },
                );
              }
            },
          ),
          SizedBox(
            height: 35,
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 6),
          //   child: Text(
          //     'Lihat Semua Daftar Absensi',
          //     style: theme.textTheme.bodyText1!.copyWith(
          //       color: theme.primaryColor,
          //       fontWeight: FontWeight.w700,
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
