import 'package:flutter/material.dart';

final customTheme = ThemeData(
  fontFamily: 'Inter',
  primaryColor: Color(0xFF0085FF),
  primaryColorDark: Color(0xFF0A71D1),
  primaryColorLight: Color(0xFFA0D1FF),
  // hoverColor: Color(0xFFE8F4FF),
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 32,
      height: 1.21,
      fontWeight: FontWeight.w700,
    ),
    headline2: TextStyle(
      fontSize: 28,
      height: 1.21,
      fontWeight: FontWeight.w700,
    ),
    headline3: TextStyle(
      fontSize: 24,
      height: 1.21,
      fontWeight: FontWeight.w700,
    ),
    headline4: TextStyle(
      fontSize: 20,
      height: 1.21,
      fontWeight: FontWeight.w700,
    ),
    headline5: TextStyle(
      fontSize: 18,
      height: 1.21,
      fontWeight: FontWeight.w500,
    ),
    headline6: TextStyle(
      fontSize: 16,
      height: 1.21,
      fontWeight: FontWeight.w600,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
      height: 1.21,
      fontWeight: FontWeight.w500,
    ),
    subtitle2: TextStyle(
      fontSize: 16,
      height: 1.21,
      fontWeight: FontWeight.w400,
    ),
    button: TextStyle(
      fontSize: 14,
      height: 1.31,
      fontWeight: FontWeight.w500,
      letterSpacing: .3,
    ),
    bodyText1: TextStyle(
      fontSize: 14,
      height: 1.31,
      fontWeight: FontWeight.w600,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      height: 1.31,
      fontWeight: FontWeight.w400,
    ),
    caption: TextStyle(
      fontSize: 12,
      height: 1.21,
      fontWeight: FontWeight.w400,
    ),
    overline: TextStyle(
      fontSize: 10,
      height: 1.21,
      fontWeight: FontWeight.w400,
    ),
  ),
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    },
  ),
);
