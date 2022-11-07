import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tmdb_riverpod/data/models/movie.dart';
import 'package:movie_tmdb_riverpod/ui/screens/movie_details/movie_details.dart';
import 'package:movie_tmdb_riverpod/widgets/custom_image.dart';
import 'package:movie_tmdb_riverpod/ui/pages/watch_list/watch%20list%20widgets/duration.dart';
import 'package:movie_tmdb_riverpod/ui/pages/watch_list/watch%20list%20widgets/genre_detail.dart';
import 'package:movie_tmdb_riverpod/ui/pages/watch_list/watch%20list%20widgets/movie_rating.dart';
import 'package:movie_tmdb_riverpod/ui/pages/watch_list/watch%20list%20widgets/year.dart';

class WatchListItem extends ConsumerWidget {
  const WatchListItem(this.movie, {super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context, ref) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetails(id: movie.id),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        child: IntrinsicHeight(
          child: Row(
            children: [
              CustomImage(
                posterUrl: movie.posterImageUrl,
                isSmall: true,
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.49,
                    child: Text(
                      movie.title!,
                      style: GoogleFonts.poppins(
                          fontSize: 16.0, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  MovieRating(
                    rating: movie.rating.toStringAsFixed(1),
                  ),
                  MovieGenre(
                    genre: movie.genres!,
                  ),
                  MovieYear(
                    year: movie.releaseDate!,
                  ),
                  MovieDuration(duration: movie.runTime.toStringAsFixed(1))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
