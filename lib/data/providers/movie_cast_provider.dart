import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_tmdb_riverpod/data/models/movie_casts_model.dart';
import 'package:movie_tmdb_riverpod/data/providers/movie_service_provider.dart';

final movieCastProvider =
    FutureProvider.family<List<MovieCastModel>, int>((ref, id) async {
  final movieService = ref.watch(movieServiceProvider);
  final casts = await movieService.getCastDetail(id);
  return casts;
});
