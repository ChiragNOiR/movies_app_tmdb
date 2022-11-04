import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_tmdb_riverpod/data/providers/movies_future_provider.dart';
import 'package:movie_tmdb_riverpod/widgets/dio/dio_exception.dart';
import 'package:movie_tmdb_riverpod/widgets/error_body.dart';
import 'package:movie_tmdb_riverpod/widgets/movie_box.dart';

class TabBarComponent extends ConsumerWidget {
  const TabBarComponent({required this.tab, super.key});

  final String tab;

  @override
  Widget build(BuildContext context, ref) {
    return Tab(
      child: ref.watch(moviesFutureProvider(tab)).when(
            loading: () => const CircularProgressIndicator(),
            error: (e, s) {
              String message = "Please try again in few minutes.";
              if (e is MoviesException) {
                message = '${e.message}';
              }
              return ErrorBody(moviesFutureProvider(tab), message: message);
            },
            data: (movies) => Container(
              padding: const EdgeInsets.only(right: 24, left: 24),
              child: GridView.builder(
                itemCount: movies.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) =>
                    MovieBoxGridView(movie: movies[index]),
              ),
            ),
          ),
    );
  }
}
