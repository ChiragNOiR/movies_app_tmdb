import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_tmdb_riverpod/data/styles/app_style.dart';
import 'package:movie_tmdb_riverpod/ui/pages/home_page/home_page.dart';
import 'package:movie_tmdb_riverpod/ui/pages/search_page/search_page.dart';
import 'package:movie_tmdb_riverpod/ui/pages/watch_list/watch_list.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  ConsumerState<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  int _currentIndex = 0;

  List<Map<String, dynamic>> get _pages {
    return const [
      {
        "page": HomePage(),
        "name": "Home",
        "action": null,
      },
      {
        "page": SearchPage(),
        "name": "Search",
        "action": null,
      },
      {
        "page": WatchList(),
        "name": "Watch list",
        "action": null,
      },
    ];
  }

  void _selectPage(int index) {
    _currentIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
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
          setState(() {
            _selectPage(index);
          });
        },
      ),
    );
  }
}
