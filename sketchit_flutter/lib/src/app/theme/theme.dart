import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color primaryColor = const Color(0xFF1c63ed);

  static ThemeData theme = ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 12,
            ),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(
            const Color(0xFF1c63ed),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      fontFamily: GoogleFonts.dosis().fontFamily,
      textTheme: TextTheme(
        labelLarge: GoogleFonts.dosis(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: GoogleFonts.dosis(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: GoogleFonts.dosis(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ));
}
