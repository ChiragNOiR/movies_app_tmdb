class Search {
  final String name;
  final double rating;
  final String posterpath;
  final String releaseDate;
  Search({
    required this.name,
    required this.rating,
    required this.posterpath,
    required this.releaseDate,
  });
  Search.fromJson(Map<String, dynamic> eachItem)
      : name = eachItem['title'] ?? '',
        rating = eachItem["vote_average"].runtimeType == int
            ? eachItem["vote_average"].toDouble()
            : eachItem["vote_average"],
        releaseDate = eachItem['release_date'] ?? '',
        posterpath =
            'https://image.tmdb.org/t/p/original${eachItem['poster_path']}';
}
