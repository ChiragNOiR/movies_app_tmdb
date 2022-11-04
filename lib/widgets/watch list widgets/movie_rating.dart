import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieRating extends StatelessWidget {
  final String rating;
  const MovieRating({required this.rating, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star_border_rounded,
          color: Colors.orange,
          size: 20,
        ),
        Text(
          rating,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
            color: Colors.orange,
          ),
        )
      ],
    );
  }
}
