import 'package:flutter/material.dart';
import 'package:movie_tmdb_riverpod/data/models/movie.dart';

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
