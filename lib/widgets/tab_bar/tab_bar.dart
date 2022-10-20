import 'package:flutter/material.dart';
import 'package:movie_tmdb_riverpod/widgets/tab_bar/components/tab_bar_component.dart';

class MovieTabBarView extends StatelessWidget {
  const MovieTabBarView({
    super.key,
    required this.controller,
    required this.tabText,
  });

  final TabController? controller;
  final List<String> tabText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 300,
      child: TabBarView(
        controller: controller,
        children: tabText.map((tab) => TabBarComponent(tab: tab)).toList(),
      ),
    );
  }
}
