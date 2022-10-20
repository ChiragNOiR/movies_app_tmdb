import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color primaryColor = const Color(0xFF242A32);
  static Color textColor = Colors.white;

  static TextStyle appBarContent = GoogleFonts.poppins(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: textColor,
  );
  static TextStyle appBarTitle = GoogleFonts.poppins(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: textColor,
  );
}
