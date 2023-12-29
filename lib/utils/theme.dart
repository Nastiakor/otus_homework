import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appThemeData = ThemeData(
  scaffoldBackgroundColor: const Color(0xFFECECEC),
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      fontSize: 22,
      color: const Color(0xFF000000),
    ),
    bodyMedium: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: const Color(0xFF2ECC71),
    ),
    bodySmall: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      fontSize: 10,
      color: const Color(0xFF2ECC71),
    ),
  ),
);
