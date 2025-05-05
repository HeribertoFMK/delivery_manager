import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.deepPurple,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 16),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
        labelStyle: TextStyle(color: Colors.deepPurple),
      ),
    );
  }
}
