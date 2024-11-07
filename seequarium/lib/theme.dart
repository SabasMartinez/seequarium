import 'package:flutter/material.dart';

final ThemeData darkMode = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 7, 65, 131),
    brightness: Brightness.dark,
  ),
);

final ThemeData lightMode = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 7, 65, 131),
    brightness: Brightness.light,
  ),
);

ThemeData get darkTheme => darkMode;

ThemeData get lightTheme => lightMode;
