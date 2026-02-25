import 'package:flutter/material.dart';

class AppTextStyles {
  static const String fontFamily = 'Montserrat';

  static const TextStyle songTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: fontFamily,
    letterSpacing: -0.5,
  );

  static const TextStyle artistName = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: Colors.white,
    fontFamily: fontFamily,
    letterSpacing: 0.5,
  );

  static const TextStyle duration = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: fontFamily,
  );

  static const TextStyle appBarTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );
}
