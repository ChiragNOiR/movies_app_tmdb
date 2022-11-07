import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_tmdb_riverpod/data/notifier/movie_searchMovie_notifier.dart';
import 'package:movie_tmdb_riverpod/data/providers/movie_service_provider.dart';

final searchMovieProvider = ChangeNotifierProvider<SearchMovieNotifier>(
  (ref) {
    return SearchMovieNotifier(ref.read(movieServiceProvider));
  },
);
