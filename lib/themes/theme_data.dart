import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.blue,
    onPrimary: Colors.black, //==================
    secondary: Color.fromARGB(255, 49, 49, 49),
    onSecondary: Colors.black, //================
    error: Colors.red,
    onError: Colors.blue,
    background: Colors.black, //===============
    onBackground: Colors.white,
    surface: Color.fromARGB(255, 49, 49, 49),
    onSurface: Colors.white,
  ),
  cardTheme: CardTheme(color: const Color.fromARGB(255, 49, 49, 49)),
  appBarTheme: AppBarTheme(
    color: Colors.black,
  ),
);

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Colors.blue,
    onPrimary: Colors.white,
    secondary: const Color.fromARGB(255, 214, 214, 214).withOpacity(0.8),
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black, //===============
  ),
  cardTheme: CardTheme(
      color: const Color.fromARGB(255, 214, 214, 214).withOpacity(0.8)),
  appBarTheme: AppBarTheme(
    color: Colors.white,
  ),
);
