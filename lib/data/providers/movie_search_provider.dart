import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_tmdb_riverpod/data/notifier/movie_searchMovie_notifier.dart';
import 'package:movie_tmdb_riverpod/data/providers/movie_service_provider.dart';

// final movieSearchProvider =
//     FutureProvider.family<List<Search>, String>((ref, query) async {
//   final movieService = ref.watch(movieServiceProvider);
//   final searches = await movieService.getSearchMovieDetails(query);
//   return searches;
// });
final searchMovieProvider = ChangeNotifierProvider<SearchMovieNotifier>(
  (ref) {
    return SearchMovieNotifier(ref.read(movieServiceProvider));
  },
);
