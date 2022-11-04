import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_tmdb_riverpod/data/models/movie.dart';
import 'package:movie_tmdb_riverpod/data/providers/movie_service_provider.dart';

final movieDetailProvider = FutureProvider.family<Movie, int>((ref, id) async {
  final movieService = ref.watch(movieServiceProvider);
  final movies = await movieService.getMoviesDetail(id);
  return movies;
});
