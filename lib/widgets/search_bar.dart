import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_tmdb_riverpod/data/providers/movie_search_provider.dart';
import 'package:movie_tmdb_riverpod/data/providers/page_index_provider.dart';

class SearchBarWidget extends ConsumerStatefulWidget {
  const SearchBarWidget(
      {super.key, this.isHomeScreen = false, this.textEnabled = false});
  final bool isHomeScreen;
  final bool textEnabled;
  @override
  ConsumerState<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends ConsumerState<SearchBarWidget> {
  TextEditingController searchNameController = TextEditingController();
  late FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    if (!widget.isHomeScreen) {
      myFocusNode.requestFocus();
    }
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 55,
          decoration: BoxDecoration(
              color: const Color(0xFF3A3F47),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                if (widget.isHomeScreen) {
                  ref.read(pageIndexProvider.notifier).state = 1;
                } else {
                  return;
                }
              },
              child: TextFormField(
                focusNode: myFocusNode,
                controller: searchNameController,
                enabled: widget.textEnabled,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          Future.microtask((() => ref
                              .read(searchMovieProvider)
                              .loadSearchDetail(searchNameController.text)));
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Color(0xFF67686D),
                        )),
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: const TextStyle(color: Color(0xFF67686D))),
              ),
            ),
          ),
        );
      },
    );
  }
}
