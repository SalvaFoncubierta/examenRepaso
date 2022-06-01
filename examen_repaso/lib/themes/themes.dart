import 'package:flutter/material.dart';

class Themes {
  static ThemeData get lightTheme {
    return ThemeData(
        textTheme: const TextTheme(
            bodyText1: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black)));
  }
}
