import 'package:flutter/material.dart';

class MyTheme {
  static const Color greenColor = Color(0xFF39A552);

  static final lightTheme = ThemeData(
      primaryColor: greenColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          elevation: 0,
          color: greenColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)))),
      textTheme: const TextTheme(
          titleLarge: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(color: Colors.black, fontSize: 16,)));
}
