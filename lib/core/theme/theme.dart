import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      shape: Border(bottom: BorderSide(color: Colors.black)),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      onPrimary: Colors.black,
      surfaceTint: Colors.transparent,
    ),
    dividerTheme: const DividerThemeData(color: Colors.black26),
    dialogTheme: const DialogTheme(
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: Colors.black),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 20, color: Colors.black),
      titleMedium: TextStyle(color: Colors.black),
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      collapsedShape: Border(top: BorderSide(color: Colors.black)),
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      shape: Border(bottom: BorderSide(color: Colors.white54)),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Colors.blue,
      onPrimary: Colors.white,
      surface: Colors.black,
      surfaceTint: Colors.transparent,
    ),
    dividerTheme: const DividerThemeData(color: Colors.white24),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: Colors.white),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 20),
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      collapsedShape: Border(top: BorderSide(color: Colors.white54)),
    ),
  );
}
