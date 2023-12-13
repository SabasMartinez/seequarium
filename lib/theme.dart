import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 7, 65, 131),
    brightness: Brightness.dark,
  ),
);

ThemeData get appTheme => appThemeData;
