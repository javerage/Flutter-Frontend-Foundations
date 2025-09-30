import 'package:flutter/material.dart';

class AppTheme {
  static const _seedColor = Color(0xFF0E1534);

  static ThemeData get lightTheme {
    var colorScheme = ColorScheme.fromSeed(seedColor: _seedColor);
    // colorScheme = colorScheme.copyWith(primary: _seedColor);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        centerTitle: true,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(color: colorScheme.onSurface.withAlpha(77)),
        ),
        filled: true,
        fillColor: colorScheme.onPrimary.withAlpha(26),
      ),
    );
  }

  static ThemeData get darkTheme {
    var colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
    );
    // colorScheme = colorScheme.copyWith(primary: _seedColor);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        centerTitle: true,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(color: colorScheme.onSurface.withAlpha(77)),
        ),
        filled: true,
        fillColor: colorScheme.onPrimary.withAlpha(13),
      ),
    );
  }
}
