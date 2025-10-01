import 'package:flutter/material.dart';
import 'package:gift_planner/features/gift_planner/presentation/screens/gift_list_screen.dart';
import 'package:google_fonts/google_fonts.dart';

// The root widget of the application.
class GiftPlannerApp extends StatelessWidget {
  const GiftPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // We define a base theme first
    final baseTheme = ThemeData(
      // 1. Use ColorScheme.fromSeed for a more modern M3 theme
      // This generates a full color palette from a single "seed" color.
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF4A148C),
      ), // A deep purple
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFF8F8F8),

      // We can keep some specific overrides if we want
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF4A148C), // Match our new seed color
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.amber,
      ),
      cardTheme: CardThemeData(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),

      // 2. Define a theme for all ElevatedButtons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Rounded corners
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),

      // 3. Define a theme for all TextFields
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        filled: true,
        fillColor: Colors.white,
      ),
    );

    return MaterialApp(
      title: 'Gift Planner',
      // We apply the Google Fonts text theme to our base theme
      theme: baseTheme.copyWith(
        textTheme: GoogleFonts.ralewayTextTheme(baseTheme.textTheme),
      ),
      // The starting point of our app's UI is the GiftListScreen.
      home: const GiftListScreen(),
    );
  }
}
