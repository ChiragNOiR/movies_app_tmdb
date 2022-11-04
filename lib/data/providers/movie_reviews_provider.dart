import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_tmdb_riverpod/data/models/reviews_model.dart';
import 'package:movie_tmdb_riverpod/data/providers/movie_service_provider.dart';

final movieReviewProvider =
    FutureProvider.family<List<ReviewsModel>, int>((ref, id) async {
  final movieService = ref.watch(movieServiceProvider);
  final reviews = await movieService.getReviewsDetail(id);
  return reviews;
});
