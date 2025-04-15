import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF6B7FD7);
  static const Color secondaryColor = Color(0xFFF5F6FA);
  static const Color backgroundColor = Color(0xFFF5F6FA);
  static const Color cardColor = Colors.white;
  static const Color textColor = Color(0xFF1D1D1D);
  static const Color subtitleColor = Color(0xFF6E6E6E);
  static const Color accentColor = Color(0xFF4CAF50);

  // Text Styles
  static const TextStyle headingStyle = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: textColor,
    letterSpacing: -0.5,
  );

  static const TextStyle subheadingStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: subtitleColor,
    letterSpacing: -0.2,
  );

  static const TextStyle cardTitleStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: textColor,
    letterSpacing: -0.2,
  );

  static const TextStyle cardSubtitleStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: subtitleColor,
    letterSpacing: -0.1,
  );

  static const TextStyle tagStyle = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.2,
  );

  // Card Decoration
  static BoxDecoration cardDecoration = BoxDecoration(
    color: cardColor,
    borderRadius: BorderRadius.circular(16.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 10,
        offset: const Offset(0, 2),
      ),
    ],
  );

  // ThemeData
  static ThemeData themeData = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: 'SF Pro Display',
    appBarTheme: const AppBarTheme(
      color: backgroundColor,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: textColor,
        letterSpacing: -0.5,
      ),
      iconTheme: IconThemeData(color: textColor),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: primaryColor,
      unselectedLabelColor: subtitleColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: primaryColor,
      unselectedItemColor: subtitleColor,
      selectedLabelStyle: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
} 