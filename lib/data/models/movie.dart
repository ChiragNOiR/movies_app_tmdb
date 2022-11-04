class Movie {
  int id;
  String? title;
  double rating;
  String? genres;
  String? description;
  String? releaseDate;
  double? popularity;
  int runTime;
  String? posterPath;
  String? detailBackgoundImage;

  Movie({
    required this.id,
    required this.title,
    required this.genres,
    required this.description,
    required this.releaseDate,
    required this.popularity,
    required this.runTime,
    required this.posterPath,
    required this.detailBackgoundImage,
    required this.rating,
  });

  String get posterImageUrl => "https://image.tmdb.org/t/p/w200$posterPath";
  String get backgroundImageUrl =>
      "https://image.tmdb.org/t/p/w500$detailBackgoundImage";

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'original_title': title,
      'poster_path': posterPath,
      'genres': genres,
      'overview': description,
      'release_date': releaseDate,
      'popularity': popularity,
      'backdrop_path': detailBackgoundImage,
      'vote_average': rating,
      'runtime': runTime,
    };
  }

  factory Movie.fromJson(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] ?? '',
      title: map['original_title'] ?? '',
      posterPath: map['poster_path'] ?? '',
      description: map['overview'] ?? '',
      genres: map['genres'] == null || map['genres'].isEmpty
          ? "Null"
          : map['genres'][0]['name'],
      popularity: map['popularity'] ?? '',
      releaseDate: map['release_date'] ?? '',
      detailBackgoundImage: map['backdrop_path'] ?? '',
      rating: map['vote_average'].runtimeType == int
          ? map['vote_average'].toDouble()
          : map['vote_average'],
      runTime: map['runtime'] ?? 0,
    );
  }
}
