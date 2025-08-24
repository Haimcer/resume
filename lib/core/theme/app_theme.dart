import 'package:flutter/material.dart';

ThemeData buildAppTheme(TextTheme textTheme) {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7C5CFF),
      brightness: Brightness.dark,
      background: const Color(0xFF0B0C10),
    ),
    scaffoldBackgroundColor: const Color(0xFF0B0C10),
    textTheme: textTheme,
    cardTheme: CardTheme(
      color: const Color(0xFF16181D),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      margin: EdgeInsets.zero,
    ),
  );
}