import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: MyColors.backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: MyColors.backgroundColor,
        elevation: 0,
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        color: MyColors.darkTextColor,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: MyColors.rating5),
      textTheme: TextTheme(
        headline4: TextStyle(
          color: MyColors.lightTextColor,
        ),
        headline5: TextStyle(
          color: MyColors.darkTextColor,
        ),
      ),
    );
  }
}

class MyColors {
  static Color backgroundColor = const Color(0xFF4b5763);
  static Color lightTextColor = const Color(0xFFd0d3d9);
  static Color darkTextColor = const Color(0xFFb5babe);

  static Color rating1 = const Color(0xffff5999);
  static Color rating2 = const Color(0xFFff70a6);
  static Color rating3 = const Color(0xFFff70a6);
  static Color rating4 = const Color(0xff3daeb4);
  static Color rating5 = const Color(0xFF109da4);
  static Color rating6 = const Color(0xFF0e838a);

  static List<Color> ratingColors = [rating1, rating2, rating3, rating4, rating5, rating6];

  static Color dotOff = const Color(0xFF4a4b53);
  static Color dotOn = const Color(0xFFeecac4);
}
