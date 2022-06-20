import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFF4b5763),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF4b5763),
        elevation: 0,
      ),
      textTheme: TextTheme(
        headline4: TextStyle(
          color: Color(0xFFd0d3d9),
        ),
        headline5: TextStyle(
          color: Color(0xFFb5babe),
        ),
      ),
    );
  }
}
