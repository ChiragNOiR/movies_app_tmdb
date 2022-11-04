import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_tmdb_riverpod/data/providers/movie_detail_provider.dart';
import 'package:movie_tmdb_riverpod/data/providers/movies_future_provider.dart';
import 'package:movie_tmdb_riverpod/data/styles/app_style.dart';
import 'package:movie_tmdb_riverpod/ui/screens/movie_details/detail_tab_bar/components/movie_cast.dart';
import 'package:movie_tmdb_riverpod/ui/screens/movie_details/detail_tab_bar/components/movie_reviews.dart';
import 'package:movie_tmdb_riverpod/widgets/dio/dio_exception.dart';
import 'package:movie_tmdb_riverpod/widgets/error_body.dart';

class DetailTabBarView extends ConsumerWidget {
  const DetailTabBarView({
    super.key,
    required this.controller,
    required this.id,
  });

  final TabController? controller;
  final int id;

  @override
  Widget build(BuildContext context, ref) {
    final movieDetails = ref.watch(movieDetailProvider(id));
    return movieDetails.when(
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
      data: (movieDetails) => SizedBox(
        width: double.maxFinite,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: TabBarView(
            controller: controller,
            children: [
              Text(
                movieDetails.description!,
                style: AppStyle.aboutMovieStyle,
              ),
              MovieReview(id),
              MovieCast(id),
            ],
          ),
        ),
      ),
    );
  }
}
