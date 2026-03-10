import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Ultra Premium "Quantum" Theme
  static const Color background = Color(0xFF05050A); // Deep void black
  static const Color surface = Color(0xFF0F101A); // Starlight surface
  static const Color surfaceGlass = Color(0x990F101A); // Translucent surface for glassmorphism
  
  // Neon Cyber Accents
  static const Color primary = Color(0xFF00F0FF); // Cyber Cyan (Primary action)
  static const Color primaryLight = Color(0xFF70FFFF);
  static const Color secondary = Color(0xFFFF007F); // Neon Magenta (Alerts/Secondary)
  static const Color tertiary = Color(0xFF7000FF); // Deep Purple (AI/Intelligence)
  
  // Text & States
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8B949E);
  static const Color divider = Color(0xFF1F2430);
  
  // Status Colors (Neon variants)
  static const Color success = Color(0xFF39FF14); // Neon Green
  static const Color warning = Color(0xFFFFEA00); // Neon Yellow/Orange
  static const Color error = Color(0xFFFF003C); // Crimson Red

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: primary,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        tertiary: tertiary,
        surface: surface,
        error: error,
      ),
      textTheme: GoogleFonts.spaceGroteskTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: const TextStyle(color: textPrimary, letterSpacing: -1),
        displayMedium: const TextStyle(color: textPrimary, letterSpacing: -0.5),
        bodyLarge: const TextStyle(color: textPrimary),
        bodyMedium: const TextStyle(color: textSecondary),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: surfaceGlass,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: primary),
      ),
      cardTheme: CardTheme(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: divider, width: 1),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: divider,
        thickness: 1,
        space: 1,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: background, // Black text on neon background
          elevation: 10,
          shadowColor: primary.withOpacity(0.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          textStyle: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: background,
        selectedItemColor: primary,
        unselectedItemColor: textSecondary,
        elevation: 20,
        type: BottomNavigationBarType.fixed,
      ),
      navigationRailTheme: const NavigationRailThemeData(
        backgroundColor: background,
        selectedIconTheme: IconThemeData(color: primary),
        unselectedIconTheme: IconThemeData(color: textSecondary),
        selectedLabelTextStyle: TextStyle(color: primary, fontWeight: FontWeight.bold),
        unselectedLabelTextStyle: TextStyle(color: textSecondary),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: primary, width: 2),
        ),
        labelStyle: const TextStyle(color: textSecondary),
        hintStyle: const TextStyle(color: textSecondary),
      ),
    );
  }
}
