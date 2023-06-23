import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  indicatorColor: Colors.blue,
  brightness: Brightness.light,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: Colors.black), //Название
    titleLarge: TextStyle(
        fontSize: 15.0, fontStyle: FontStyle.normal, color: Colors.black),
    bodyMedium:
        TextStyle(fontSize: 14.0, fontFamily: 'Hind'), //покачто не юзается
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  indicatorColor: Colors.blue,
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: Colors.white), //Название
    titleLarge: TextStyle(
        fontSize: 15.0, fontStyle: FontStyle.normal, color: Colors.white),
    bodyMedium:
        TextStyle(fontSize: 14.0, fontFamily: 'Hind'), //покачто не юзается
  ),
);
