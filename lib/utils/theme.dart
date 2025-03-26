import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF2196F3);
  static const Color secondaryColor = Color(0xFF8BC34A);
  static const Color scaffoldBackgroundColor = Color(0xFFFFFFFF);
  static const String fontFAMILY = 'Roboto';

  static const TextStyle titleStyle = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    fontFamily: fontFAMILY,
    color: primaryColor,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16.0,
    fontFamily: fontFAMILY,
    color: Color(0xFF333333),
  );

  static ThemeData get theme {
    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(
          primaryColor.toARGB32(),
          {
            50: primaryColor.withAlpha(25),
            100: primaryColor.withAlpha(50),
            200: primaryColor.withAlpha(75),
            300: primaryColor.withAlpha(100),
            400: primaryColor.withAlpha(125),
            500: primaryColor.withAlpha(150),
            600: primaryColor.withAlpha(175),
            700: primaryColor.withAlpha(200),
            800: primaryColor.withAlpha(225),
            900: primaryColor.withAlpha(255),
          },
        ),
      ).copyWith(
        secondary: secondaryColor,
      ),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      fontFamily: fontFAMILY,
      textTheme: TextTheme(
        headlineLarge: titleStyle,
        titleLarge: titleStyle,
        titleMedium: titleStyle,
        titleSmall: titleStyle,
        bodyLarge: bodyStyle,
        bodyMedium: bodyStyle,
        bodySmall: bodyStyle
      ),
    );
  }
}

class PrimaryColor {
}