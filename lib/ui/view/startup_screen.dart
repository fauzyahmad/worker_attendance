import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worker_attendace/core/view_model/startup_view_model.dart';

class StartupScreen extends StatefulWidget {
  static const routeName = '/startup';
  const StartupScreen({Key? key}) : super(key: key);

  @override
  _StartupScreenState createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  @override
  void initState() {
    checkIfAvailable();
    super.initState();
  }

  Future checkIfAvailable() async {
    await Provider.of<StartupViewModel>(context, listen: false)
        .handleStartupView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation(
            Color(0xff19c7c1),
          ),
        ),
      ),
    );
  }
}
