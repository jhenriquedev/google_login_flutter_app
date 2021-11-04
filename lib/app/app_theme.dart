import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const Color appColor = Color(0xFF4286F5);
  static const Color backgroundColor = Color(0xFFffffff);
  static const Color textColor = Color(0xFF404549);

  static TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.ptSans(
      fontSize: 36,
      height: 1.5,
      letterSpacing: 0,
      color: textColor,
    ),
    bodyText1: GoogleFonts.ptSans(
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0,
      color: textColor,
    ),
  );
}
