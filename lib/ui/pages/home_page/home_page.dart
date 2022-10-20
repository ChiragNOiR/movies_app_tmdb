import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_tmdb_riverpod/data/providers/movie_service_provider.dart';
import 'package:movie_tmdb_riverpod/data/providers/movies_future_provider.dart';
import 'package:movie_tmdb_riverpod/data/styles/app_style.dart';
import 'package:movie_tmdb_riverpod/widgets/dio/dio_exception.dart';
import 'package:movie_tmdb_riverpod/widgets/error_body.dart';
import 'package:movie_tmdb_riverpod/widgets/movie_box.dart';
import 'package:movie_tmdb_riverpod/widgets/search_bar.dart';
import 'package:movie_tmdb_riverpod/widgets/tab_bar/tab_bar.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    List<String> tabText = [
      'Now Playing',
      'Upcoming',
      'Top Rated',
      'Popular',
    ];
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                    child: Text(
                      "What do you want to watch?",
                      style: AppStyle.appBarContent,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SearchBar(),
                  ),
                  ref.watch(moviesFutureProvider("Top Rated")).when(
                        error: (e, s) {
                          String message = "Please try again in few minutes.";
                          if (e is MoviesException) {
                            message = '${e.message}';
                          }
                          return ErrorBody(moviesFutureProvider("Top Rated"),
                              message: message);
                        },
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        data: (movies) {
                          return RefreshIndicator(
                            onRefresh: () async {
                              return ref
                                  .refresh(moviesFutureProvider("Top Rated"));
                            },
                            child: SizedBox(
                              height: 250,
                              child: ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: movies.length,
                                  itemBuilder: (context, index) =>
                                      MovieBoxListView(movie: movies[index])),
                            ),
                          );
                        },
                      ),
                  const SizedBox(
                    height: 30,
                  ),
                  TabBar(
                    indicatorColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    controller: controller,
                    tabs: tabText
                        .map((tabText) => Tab(
                              child: Text(tabText),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
          body: MovieTabBarView(
            controller: controller,
            tabText: tabText,
          ),
        ),
      ),
    );
  }
}
