import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  datePickerTheme: const DatePickerThemeData(
    backgroundColor: Color(0xFFFFFFFF),
  ),
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: const Color(0xFF321834),
    onPrimary: const Color(0xFFFFFFFF),
    secondary: const Color(0xFF3A333A),
    onSecondary: const Color(0xFF321834),
    error: Colors.red.shade900,
    onError: const Color(0xFFFFFFFF),
    background: const Color(0xFFFFFFFF),
    onBackground: const Color(0xFF321834),
    surface: const Color(0xffD8D0D8),
    onSurface: const Color(0xFF321834),
    tertiary: const Color(0xFFC0B3C0),
    primaryContainer: const Color(0xFF5A5A5A),
    onPrimaryContainer: const Color(0xFF9F999F),
  ),
);
