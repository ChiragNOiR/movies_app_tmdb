import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_tmdb_riverpod/data/providers/page_index_provider.dart';
import 'package:movie_tmdb_riverpod/data/styles/app_style.dart';
import 'package:movie_tmdb_riverpod/ui/pages/home_page/home_page.dart';
import 'package:movie_tmdb_riverpod/ui/pages/search_page/components/serach_body.dart';

import 'package:movie_tmdb_riverpod/ui/pages/watch_list/watch_list.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  ConsumerState<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  List<Map<String, dynamic>> get _pages {
    return [
      {
        "page": const HomePage(),
        "name": "Home",
        "action": null,
      },
      {
        "page": const SearchTab(),
        "name": "Search",
        "action": null,
      },
      {
        "page": const WatchList(),
        "name": "Watch list",
        "action": null,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(pageIndexProvider);
    return Scaffold(
      body: _pages[selectedIndex]["page"],
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.blue, width: 2.0))),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          elevation: 2.0,
          backgroundColor: AppStyle.primaryColor,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.grey,
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.grey,
              label: 'Search',
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.grey,
              label: 'Watch list',
              icon: Icon(Icons.watch_later),
            ),
          ],
          onTap: (index) {
            // setState(() {
            //   _selectPage(index);
            // });
            ref.read(pageIndexProvider.notifier).update((state) => index);
          },
        ),
      ),
    );
  }
}
