import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromARGB(255, 255, 232, 212);
  static const Color background = Color.fromARGB(255, 255, 255, 255);
  static const Color textPrimary = Color.fromARGB(255, 0, 0, 0);
  static const Color surface = Color.fromARGB(255, 255, 255, 255);

  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primary,
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme.light(primary: primary, surface: surface),
      fontFamily: 'Inter',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w300,
          color: textPrimary,
          letterSpacing: 1.5,
        ),
        headlineSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: textPrimary,
          letterSpacing: 1.2,
        ),
        bodyLarge: TextStyle(fontSize: 16, color: textPrimary),
        bodyMedium: TextStyle(fontSize: 14, color: textPrimary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.textPrimary, // black fill
          foregroundColor: AppTheme.background, // white text
          elevation: 0, // no shadow
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // sharp corners
          ),
          textStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
            letterSpacing: 2.5, // wide spacing
          ),
        ),
      ),
    );
  }
}
