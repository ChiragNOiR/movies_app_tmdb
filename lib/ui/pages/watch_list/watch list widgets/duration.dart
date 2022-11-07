import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDuration extends StatelessWidget {
  final String duration;
  const MovieDuration({required this.duration, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.access_time_outlined,
          color: Colors.white,
          size: 20,
        ),
        Text(
          duration,
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
