import 'package:flutter/material.dart';
import 'package:movie_tmdb_riverpod/data/styles/app_style.dart';
import 'package:movie_tmdb_riverpod/widgets/search_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Search',
          style: AppStyle.appBarTitle,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.circle))],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: SearchBar(),
          ),
          // ListView(
          //   children: [
          //     SearchMovies(),
          //   ],
          // )
        ],
      ),
    );
  }
}
