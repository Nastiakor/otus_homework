import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static const Color lightGreyColor = Color(0xFFECECEC);
  static const Color mediumGreyColor = Color(0xFFC2C2C2);
  static const Color darkGreyColor = Color(0xFF797676);
  static const Color lightGreenColor = Color(0xFF2ECC71);
  static const Color darkGreenColor = Color(0xFF165932);
  static const Color darkGreenColor2 = Color(0xFF2D490C);

  static final TextStyle _baseStyle = GoogleFonts.roboto();

  static final BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    boxShadow: [
      BoxShadow(
        color: Color(0xFF000000).withOpacity(0.1),
        offset: Offset(0, 4),
        blurRadius: 10,
      ),
    ],
  );

  static final TextTheme textTheme = TextTheme(
    bodySmall: _baseStyle.copyWith(
        fontWeight: FontWeight.w400, fontSize: 10, color: lightGreenColor),
    bodyMedium: _baseStyle.copyWith(
        fontWeight: FontWeight.w400, fontSize: 16, color: lightGreenColor),
    bodyLarge: _baseStyle.copyWith(
        fontWeight: FontWeight.w500, fontSize: 22, color: Colors.black),
    titleSmall: _baseStyle.copyWith(
        fontWeight: FontWeight.w500, fontSize: 16, color: darkGreenColor),
    titleMedium: _baseStyle.copyWith(
        fontWeight: FontWeight.w400, fontSize: 20, color: darkGreenColor),
    titleLarge: _baseStyle.copyWith(
        fontWeight: FontWeight.w500, fontSize: 24, color: Colors.black),
    labelSmall: _baseStyle.copyWith(
        fontWeight: FontWeight.w400, fontSize: 12, color: darkGreyColor),
    labelMedium: _baseStyle.copyWith(
        fontWeight: FontWeight.w400, fontSize: 13, color: darkGreyColor),
    labelLarge: _baseStyle.copyWith(
        fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
    displaySmall: _baseStyle.copyWith(
        fontWeight: FontWeight.w700, fontSize: 13, color: darkGreyColor),
    displayLarge: _baseStyle.copyWith(
        fontWeight: FontWeight.w900, fontSize: 40, color: mediumGreyColor),
  );

  static final ThemeData theme = ThemeData().copyWith(
    colorScheme: ThemeData().colorScheme.copyWith(background: Colors.white),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 4,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: textTheme,
  );
}
