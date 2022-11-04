import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color primaryColor = const Color(0xFF242A32);
  static Color textColor = Colors.white;
  static Color reviewRatingColor = const Color(0xFF0296E5);

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
  static TextStyle movieTitle = GoogleFonts.poppins(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: textColor,
  );
  static TextStyle movieDetails = GoogleFonts.poppins(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
    letterSpacing: 2,
  );
  static TextStyle aboutMovieStyle = GoogleFonts.poppins(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
    color: textColor,
  );
  static TextStyle reviewerNameStyle = GoogleFonts.poppins(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: textColor,
  );
  static TextStyle reviewerDescription = GoogleFonts.poppins(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: textColor,
  );
  static TextStyle ratingStyle = GoogleFonts.poppins(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: reviewRatingColor,
  );
  static TextStyle castNameStyle = GoogleFonts.poppins(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: textColor,
  );
}
