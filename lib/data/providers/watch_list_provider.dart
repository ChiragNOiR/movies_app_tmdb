import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_tmdb_riverpod/data/notifier/movie_listitem_notifier.dart';

final watchListProvider = ChangeNotifierProvider<WatchListNotifier>(
  (ref) {
    return WatchListNotifier();
  },
);
