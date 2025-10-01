import 'package:flutter/material.dart';

// This file contains the color definitions for both light and dark themes.

// 1. Define the seed color that will generate the color palettes.
const _seedColor = Color(0xFF2E7D32); // A nice green

// 2. Create the light ColorScheme from the seed color.
final lightColorScheme = ColorScheme.fromSeed(
  seedColor: _seedColor,
  brightness: Brightness.light,
);

// 3. Create the dark ColorScheme from the seed color.
final darkColorScheme = ColorScheme.fromSeed(
  seedColor: _seedColor,
  brightness: Brightness.dark,
);
