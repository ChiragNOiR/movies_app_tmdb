import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieGenre extends StatelessWidget {
  final String genre;
  const MovieGenre({required this.genre, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.airplane_ticket,
          color: Colors.white,
          size: 20,
        ),
        Text(
          genre,
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
