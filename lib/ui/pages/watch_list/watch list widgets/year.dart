import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieYear extends StatelessWidget {
  final String year;
  const MovieYear({required this.year, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.calendar_today_outlined,
          color: Colors.white,
          size: 20,
        ),
        Text(
          year,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
