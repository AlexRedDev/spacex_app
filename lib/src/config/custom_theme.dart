import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get dark {
    return ThemeData(
      primaryColor: Colors.white,
      hintColor: Colors.white54,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(backgroundColor: Colors.grey[850]),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        headline2: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        bodyText1: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white54),
      ),
    );
  }
}
