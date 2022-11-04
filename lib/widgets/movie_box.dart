import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_tmdb_riverpod/data/models/movie.dart';
import 'package:movie_tmdb_riverpod/ui/screens/movie_details/movie_details.dart';

class MovieBoxListView extends StatelessWidget {
  final Movie movie;

  const MovieBoxListView({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetails(
                id: movie.id,
              ),
            )),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            imageUrl: movie.posterImageUrl,
            width: 150,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class MovieBoxGridView extends StatelessWidget {
  final Movie movie;

  const MovieBoxGridView({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetails(
              id: movie.id,
            ),
          )),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: movie.posterImageUrl,
          width: 150,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
