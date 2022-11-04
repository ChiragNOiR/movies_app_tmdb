import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_tmdb_riverpod/data/providers/movie_reviews_provider.dart';
import 'package:movie_tmdb_riverpod/data/providers/movies_future_provider.dart';
import 'package:movie_tmdb_riverpod/data/styles/app_style.dart';
import 'package:movie_tmdb_riverpod/widgets/dio/dio_exception.dart';
import 'package:movie_tmdb_riverpod/widgets/error_body.dart';

class MovieReview extends ConsumerWidget {
  const MovieReview(this.id, {super.key});
  final int id;

  @override
  Widget build(BuildContext context, ref) {
    final reviewDetails = ref.watch(movieReviewProvider(id));
    return reviewDetails.when(
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
        data: (reviewDetails) => ListView.builder(
              itemCount: reviewDetails.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(reviewDetails[index].photo!),
                          radius: 20,
                        ),
                        Text(
                          reviewDetails[index].rating.toString(),
                          style: AppStyle.ratingStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reviewDetails[index].reviewerName!,
                          style: AppStyle.reviewerNameStyle,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.70,
                          child: Text(
                            reviewDetails[index].content!,
                            // overflow: TextOverflow.ellipsis,
                            maxLines: 10,
                            style: AppStyle.reviewerDescription,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
