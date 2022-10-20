class Movie {
  String? title;
  String? rating;
  String? genres;
  String? description;
  String? releaseDate;
  double? popularity;
  double? runTime;
  String? posterPath;

  Movie({
    required this.title,
    required this.genres,
    required this.description,
    required this.releaseDate,
    required this.popularity,
    // required this.runTime,
    required this.posterPath,
  });

  String get posterImageUrl => "https://image.tmdb.org/t/p/w200$posterPath";

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'poster_path': posterPath,
      'rating': rating,
      'genres': genres,
      'overview': description,
      'release_date': releaseDate,
      'popularity': popularity,
      // 'runtime': runTime,
    };
  }

  factory Movie.fromJson(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] ?? '',
      posterPath: map['poster_path'] ?? '',
      description: map['overview'] ?? '',
      genres: map['genres'] ?? '',
      popularity: map['popularity'] ?? '',
      releaseDate: map['release_date'] ?? '',
      // runTime: map['runtime'] ?? '',
    );
  }
}
