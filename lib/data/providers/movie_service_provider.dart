import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_tmdb_riverpod/data/config/environment_config.dart';
import 'package:movie_tmdb_riverpod/data/services/movie_service.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  final config = ref.watch(environmentConfigProvider);

  return MovieService(config, Dio());
});
