import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_tmdb_riverpod/data/providers/movie_cast_provider.dart';
import 'package:movie_tmdb_riverpod/data/providers/movies_future_provider.dart';
import 'package:movie_tmdb_riverpod/data/styles/app_style.dart';
import 'package:movie_tmdb_riverpod/widgets/dio/dio_exception.dart';
import 'package:movie_tmdb_riverpod/widgets/error_body.dart';

class MovieCast extends ConsumerWidget {
  const MovieCast(this.id, {super.key});
  final int id;

  @override
  Widget build(BuildContext context, ref) {
    final castDetail = ref.watch(movieCastProvider(id));
    return castDetail.when(
      error: (e, s) {
        String message = "Please try again in few minutes.";
        if (e is MoviesException) {
          message = '${e.message}';
        }
        return ErrorBody(moviesFutureProvider("Top Rated"), message: message);
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (castDetail) => GridView.builder(
        itemCount: castDetail.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 70, mainAxisSpacing: 30),
        itemBuilder: (context, index) => Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                castDetail[index].profile,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              castDetail[index].actorName,
              style: AppStyle.castNameStyle,
            )
          ],
        ),
      ),
    );
  }
}
