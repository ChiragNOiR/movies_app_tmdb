import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_tmdb_riverpod/data/models/movie.dart';
import 'package:movie_tmdb_riverpod/data/providers/movie_service_provider.dart';

final moviesFutureProvider =
    FutureProvider.family.autoDispose<List<Movie>, String>((ref, tab) async {
  ref.keepAlive();

  final movieService = ref.watch(movieServiceProvider);
  final movies = await movieService.getMovies(tab);
  return movies;
});
