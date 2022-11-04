import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_tmdb_riverpod/data/providers/movie_detail_provider.dart';
import 'package:movie_tmdb_riverpod/data/providers/movies_future_provider.dart';
import 'package:movie_tmdb_riverpod/data/providers/watch_list_provider.dart';
import 'package:movie_tmdb_riverpod/data/styles/app_style.dart';
import 'package:movie_tmdb_riverpod/ui/screens/movie_details/detail_tab_bar/detail_tab_bar.dart';
import 'package:movie_tmdb_riverpod/widgets/dio/dio_exception.dart';
import 'package:movie_tmdb_riverpod/widgets/error_body.dart';
import 'package:movie_tmdb_riverpod/widgets/watch%20list%20widgets/movie_rating.dart';

class MovieDetails extends ConsumerStatefulWidget {
  const MovieDetails({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  ConsumerState<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends ConsumerState<MovieDetails>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final movieDetails = ref.watch(movieDetailProvider(widget.id));
    List<String> tabDetailText = [
      'About Movie',
      'Reviews',
      'Cast',
    ];
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
      data: (movieDetails) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'Detail',
            style: AppStyle.appBarTitle,
          ),
          actions: [
            IconButton(
              onPressed: () {
                final watchlistService = ref.watch(watchListProvider);
                final watch = watchlistService.toggle(movieDetails);
                return watch;
              },
              icon: const Icon(Icons.bookmark),
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Stack(
                    children: [
                      const SizedBox(
                        height: 400,
                      ),
                      Positioned(
                        child: SizedBox(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          child: CachedNetworkImage(
                            imageUrl: movieDetails.backgroundImageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 70,
                        left: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CachedNetworkImage(
                            imageUrl: movieDetails.posterImageUrl,
                            width: 110,
                            height: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        width: 75,
                        height: 35,
                        left: 310,
                        top: 200,
                        child: FloatingActionButton.extended(
                          backgroundColor: Colors.grey.shade700,
                          onPressed: () {},
                          label: MovieRating(
                              rating: movieDetails.rating.toStringAsFixed(1)),
                        ),
                      ),
                      Positioned(
                        bottom: 105,
                        left: 145,
                        child: Text(
                          movieDetails.title!,
                          style: AppStyle.movieTitle,
                          maxLines: 2,
                        ),
                      ),
                      Positioned(
                        left: 35,
                        bottom: 25,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.grey,
                              size: 20,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              DateTime.parse(movieDetails.releaseDate!)
                                  .year
                                  .toString(),
                              style: AppStyle.movieDetails,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '|',
                              style: AppStyle.movieDetails,
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.access_time_outlined,
                              color: Colors.grey,
                              size: 20,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '${movieDetails.runTime} Minutes',
                              style: AppStyle.movieDetails,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '|',
                              style: AppStyle.movieDetails,
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.airplane_ticket_outlined,
                              color: Colors.grey,
                              size: 20,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              movieDetails.genres!,
                              style: AppStyle.movieDetails,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  TabBar(
                    indicatorColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: controller,
                    tabs: tabDetailText
                        .map((tabDetailText) => Tab(
                              child: Text(tabDetailText),
                            ))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ],
          body: DetailTabBarView(
            controller: controller,
            id: widget.id,
          ),
        ),
      ),
    );
  }
}
