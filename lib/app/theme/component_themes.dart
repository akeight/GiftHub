import 'package:flutter/material.dart';

// This file defines the themes for specific widgets.

class ComponentThemes {
  // Each component theme is a static method for easy access.
  static CardThemeData get cardTheme => CardThemeData(
    elevation: 1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
  );

  static ElevatedButtonThemeData get elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      );

  static InputDecorationTheme inputDecorationTheme(ColorScheme colorScheme) =>
      InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        filled: true,
        fillColor: colorScheme.surface,
      );

  static AppBarTheme appBarTheme(ColorScheme colorScheme) => AppBarTheme(
    backgroundColor: colorScheme.primary,
    foregroundColor: colorScheme.onPrimary,
    elevation: 4,
  );

  static FloatingActionButtonThemeData floatingActionButtonTheme(
    ColorScheme colorScheme,
  ) => FloatingActionButtonThemeData(
    backgroundColor: colorScheme.secondary,
    foregroundColor: colorScheme.onSecondary,
  );
}
