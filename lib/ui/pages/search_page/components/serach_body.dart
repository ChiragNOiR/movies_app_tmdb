import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tmdb_riverpod/data/notifier/movie_searchMovie_notifier.dart';
import 'package:movie_tmdb_riverpod/data/providers/movie_search_provider.dart';
import 'package:movie_tmdb_riverpod/widgets/empty_data.dart';
import 'package:movie_tmdb_riverpod/widgets/search_bar.dart';
import 'package:movie_tmdb_riverpod/widgets/watch_list_item.dart';

class SearchTab extends ConsumerStatefulWidget {
  const SearchTab({super.key});
  @override
  ConsumerState<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends ConsumerState<SearchTab> {
  @override
  Widget build(BuildContext context) {
    // List<Movie> movies = ref.watch(watchListProvider).watchlist;
    return Scaffold(
      backgroundColor: const Color(0xFF242A32),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search',
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: const Color(0xFF242A32),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SearchBarWidget(isHomeScreen: false, textEnabled: true),
            ),
            Consumer(
              builder: ((context, ref, child) {
                final searchDetails = ref
                    .watch<SearchMovieNotifier>(searchMovieProvider)
                    .searchDetails;
                if (searchDetails == null) {
                  return Container();
                } else if (searchDetails.isEmpty) {
                  return const EmptyData();
                }
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width * 1,
                  child: ListView.builder(
                      itemCount: searchDetails.length,
                      itemBuilder: ((context, index) {
                        // return Padding(
                        //   padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        //   child: Row(
                        //     children: [
                        //       ClipRRect(
                        //         borderRadius: BorderRadius.circular(10),
                        //         child: CachedNetworkImage(
                        //           imageUrl: searchDetails[index].posterpath,
                        //           fit: BoxFit.cover,
                        //           height:
                        //               MediaQuery.of(context).size.height * 0.12,
                        //           width: 90,
                        //         ),
                        //       ),
                        //       const SizedBox(
                        //         width: 30,
                        //       ),
                        //       Padding(
                        //         padding: const EdgeInsets.only(bottom: 70),
                        //         child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Text(searchDetails[index].name,
                        //                 style: GoogleFonts.poppins(
                        //                     color: Colors.white, fontSize: 18)),
                        //             Row(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.spaceBetween,
                        //               children: [
                        //                 const Icon(
                        //                   Icons.star_border_outlined,
                        //                   color: Color(0xFFFF8700),
                        //                   size: 18,
                        //                 ),
                        //                 Padding(
                        //                   padding: const EdgeInsets.symmetric(
                        //                       horizontal: 5),
                        //                   child: Text(
                        //                     searchDetails[index]
                        //                         .rating
                        //                         .toString(),
                        //                     style: const TextStyle(
                        //                         color: Color(0xFFFF8700),
                        //                         fontWeight: FontWeight.bold),
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //             Text(searchDetails[index].releaseDate,
                        //                 style: GoogleFonts.poppins(
                        //                     color: Colors.white, fontSize: 12)),
                        //           ],
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // );
                        return WatchListItem(searchDetails[index]);
                      })),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
