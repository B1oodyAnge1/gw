import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: Colors.white), //Название
    titleLarge: TextStyle(
        fontSize: 20.0, fontStyle: FontStyle.italic, color: Colors.black),
    bodyMedium:
        TextStyle(fontSize: 14.0, fontFamily: 'Hind'), //покачто не юзается
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.black,
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: Colors.black), //Название
    titleLarge: TextStyle(
        fontSize: 19.0, fontStyle: FontStyle.italic, color: Colors.white),
    bodyMedium:
        TextStyle(fontSize: 14.0, fontFamily: 'Hind'), //покачто не юзается
  ),
);
