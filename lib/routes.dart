import 'package:flutter/material.dart';
import 'package:worker_attendace/ui/view/auth_screen.dart';
import 'package:worker_attendace/ui/view/homescreen.dart';
import 'package:worker_attendace/ui/view/login_screen.dart';
import 'package:worker_attendace/ui/view/signup_screen.dart';
import 'package:worker_attendace/ui/view/startup_screen.dart';

final Map<String, Widget Function(BuildContext)> routesCustom = {
  HomeScreen.routeName: (ctx) => HomeScreen(),
  StartupScreen.routeName: (ctx) => StartupScreen(),
  AuthScreen.routeName: (ctx) => AuthScreen(),
  LoginScreen.routeName: (ctx) => LoginScreen(),
  SignUpScreen.routeName: (ctx) => SignUpScreen(),
};
