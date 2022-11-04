// ignore: file_names
import 'package:flutter/material.dart';
import 'package:movie_tmdb_riverpod/data/models/movie.dart';
import 'package:movie_tmdb_riverpod/data/services/movie_service.dart';

class SearchMovieNotifier extends ChangeNotifier {
  SearchMovieNotifier(this._service);
  List<Movie>? _searchData;
  List<Movie>? get searchDetails => _searchData;
  final MovieService _service;
  void loadSearchDetail(query) async {
    _searchData = await _service.getSearchMovieDetails(query);
    notifyListeners();
  }
}
