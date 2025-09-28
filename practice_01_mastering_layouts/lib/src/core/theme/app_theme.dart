import 'package:flutter/material.dart';

class AppTheme {
  // Private constructor
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.blueGrey.shade50,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ),
    textTheme: AppTextStyles.lightTextTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey.shade900,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade800,
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.dark,
      surface: Colors.grey.shade900,
    ),
    textTheme: AppTextStyles.darkTextTheme,
  );

  static Decoration getCardDecoration(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: isDarkMode
            ? [Colors.blue.shade900, Colors.grey.shade800]
            : [Colors.blue.shade100, Colors.white],
      ),
      borderRadius: BorderRadius.circular(AppSpacing.medium),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(51),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }
}

class AppTextStyles {
  AppTextStyles._();

  static const _lightTextColor = Colors.black87;
  static const _darkTextColor = Colors.white;

  static final TextTheme lightTextTheme = TextTheme(
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: _lightTextColor,
    ),
    titleMedium: TextStyle(fontSize: 16, color: Colors.grey.shade600),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: _lightTextColor,
    ),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.grey.shade600),
  );

  static final TextTheme darkTextTheme = TextTheme(
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: _darkTextColor,
    ),
    titleMedium: TextStyle(fontSize: 16, color: Colors.grey.shade400),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: _darkTextColor,
    ),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.grey.shade400),
  );
}

class AppSpacing {
  AppSpacing._();

  static const double small = 4.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double statItemSpacing = 5.0;
}
