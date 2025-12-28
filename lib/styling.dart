import 'package:flutter/material.dart';

const Color mainColor = Color(0xFFFF00AA);

const Color activeColor = Color(0xFF39FF14);

const Color inactiveColor = Color(0xFF9D00FF);

const TextStyle bodyText = TextStyle(
  color: Colors.white,
  fontSize: 16,
);

final ThemeData neverHappyTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  primaryColor: mainColor,
  colorScheme: const ColorScheme.dark().copyWith(
    primary: mainColor,
    secondary: activeColor,
    surface: Colors.black,
    onPrimary: Colors.white,
    onSurface: Colors.white,
  ),
);
