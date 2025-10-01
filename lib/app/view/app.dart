import 'package:flutter/material.dart';
import 'package:gift_planner/features/gift_planner/screens/gift_list_screen.dart';

// The root widget of the application.
// Its only job is to set up the MaterialApp and theme.
class GiftPlannerApp extends StatelessWidget {
  const GiftPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gift Planner',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F8F8),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
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
      ),
      // The starting point of our app's UI is the GiftListScreen.
      home: const GiftListScreen(),
    );
  }
}
