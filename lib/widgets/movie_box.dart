import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_tmdb_riverpod/data/models/movie.dart';
import 'package:movie_tmdb_riverpod/widgets/dio/dio_exception.dart';

class MovieBoxListView extends StatelessWidget {
  final Movie movie;

  const MovieBoxListView({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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

class MovieBoxGridView extends StatelessWidget {
  final Movie movie;

  const MovieBoxGridView({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        imageUrl: movie.posterImageUrl,
        width: 150,
        fit: BoxFit.fill,
      ),
    );
  }
}
