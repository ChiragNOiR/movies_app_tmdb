import 'package:flutter/material.dart';
import 'package:movie_tmdb_riverpod/data/models/movie.dart';

// class WatchListNotifier extends StateNotifier<List<Movie>> {
//   WatchListNotifier() : super([]);

//   void toggleMovie(Movie movie) {
//     if (state.contains(movie)) {
//       state = [
//         for (final prevMovie in state)
//           if (prevMovie != movie) movie
//       ];
//     } else {
//       state = [...state, movie];
//     }
//   }
// }
class WatchListNotifier extends ChangeNotifier {
  List<Movie> get watchlist => _watchList;
  final List<Movie> _watchList = <Movie>[];

  void toggle(Movie movie) {
    if (_watchList.contains(movie)) {
      _watchList.remove(movie);
    } else {
      _watchList.add(movie);
    }
    notifyListeners();
  }
}
