import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_tmdb_riverpod/data/models/movie.dart';

import 'package:movie_tmdb_riverpod/data/providers/watch_list_provider.dart';
import 'package:movie_tmdb_riverpod/data/styles/app_style.dart';
import 'package:movie_tmdb_riverpod/widgets/watch_list_item.dart';

class WatchList extends ConsumerWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    List<Movie> movies = ref.watch(watchListProvider).watchlist;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Watch List',
          style: AppStyle.appBarTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => WatchListItem(movies[index]),
        itemCount: movies.length,
      ),
    );
  }
}
