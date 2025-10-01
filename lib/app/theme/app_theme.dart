import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_schemes.dart';
import 'component_themes.dart';

// This is the main theme file that composes the final ThemeData.
class AppTheme {
  // Define the light theme by building it with the light color scheme.
  static final ThemeData lightTheme = _buildTheme(lightColorScheme);

  // Define the dark theme by building it with the dark color scheme.
  static final ThemeData darkTheme = _buildTheme(darkColorScheme);

  // The private _buildTheme method creates the ThemeData from a ColorScheme.
  static ThemeData _buildTheme(ColorScheme colorScheme) {
    // Start with a base theme defined by the color scheme.
    final baseTheme = ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      scaffoldBackgroundColor: colorScheme.surface,
      // Use the component theme methods to style individual widgets.
      cardTheme: ComponentThemes.cardTheme,
      elevatedButtonTheme: ComponentThemes.elevatedButtonTheme,
      inputDecorationTheme: ComponentThemes.inputDecorationTheme(colorScheme),
      appBarTheme: ComponentThemes.appBarTheme(colorScheme),
      floatingActionButtonTheme: ComponentThemes.floatingActionButtonTheme(
        colorScheme,
      ),
    );

    // Apply the Raleway font to the base theme's text theme.
    return baseTheme.copyWith(
      textTheme: GoogleFonts.ralewayTextTheme(baseTheme.textTheme),
    );
  }
}
