import 'package:flutter/material.dart';

//Colors of light theme
class AppTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    canvasColor: const Color.fromARGB(255, 255, 255, 255),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(223, 0, 0, 0),
      onPrimary: Color.fromARGB(255, 0, 0, 0),
      secondary: Color.fromARGB(255, 255, 255, 255),
      onSecondary: Color.fromARGB(255, 225, 225, 225),
      error: Colors.red,
      onError: Colors.black,
      background: Color.fromARGB(255, 255, 255, 255),
      onBackground: Color.fromARGB(255, 0, 0, 0),
      surface: Color.fromARGB(255, 255, 255, 255),
      onSurface: Colors.black,
    ),
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color(0xFFFFB800),
        selectionColor: Color(0xFFFFB800),
        selectionHandleColor: Colors.black),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
    appBarTheme: const AppBarTheme(
        color: Color.fromARGB(222, 255, 255, 255), elevation: 0),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color.fromARGB(61, 128, 128, 128),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color.fromARGB(0, 33, 149, 243)),
        borderRadius: BorderRadius.circular(15.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color.fromARGB(0, 128, 128, 128)),
        borderRadius: BorderRadius.circular(15.0),
      ),
      
      labelStyle: const TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 16,
      ),
    ),
  );
//Colors of dark theme
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    canvasColor: const Color.fromARGB(255, 25, 25, 25),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromARGB(217, 255, 255, 255),
      onPrimary: Color.fromARGB(255, 255, 255, 255),
      secondary: Color.fromARGB(255, 0, 0, 0),
      onSecondary: Color.fromARGB(255, 25, 25, 25),
      error: Colors.red,
      onError: Color.fromARGB(255, 255, 255, 255),
      background: Color.fromARGB(255, 0, 0, 0),
      onBackground: Color.fromARGB(255, 255, 255, 255),
      surface: Color.fromARGB(255, 0, 0, 0),
      onSurface: Color.fromARGB(255, 255, 255, 255),
    ),
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color(0xFFFFB800),
        selectionColor: Color(0xFFFFB800),
        selectionHandleColor: Colors.black),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
    appBarTheme:
        const AppBarTheme(color: Color.fromARGB(222, 0, 0, 0), elevation: 0),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color.fromARGB(61, 128, 128, 128),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color.fromARGB(0, 33, 149, 243)),
        borderRadius: BorderRadius.circular(15.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color.fromARGB(0, 128, 128, 128)),
        borderRadius: BorderRadius.circular(15.0),
      ),
      labelStyle: const TextStyle(
        color: Color.fromARGB(255, 254, 254, 254),
        fontSize: 16,
      ),
    ),
  );
}
