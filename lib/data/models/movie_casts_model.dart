class MovieCastModel {
  String actorName;
  String profile;

  MovieCastModel({
    required this.actorName,
    required this.profile,
  });

  MovieCastModel.fromJson(Map<String, dynamic> json)
      : actorName = json['name'],
        profile = json['profile_path'] == null
            ? ''
            : "https://image.tmdb.org/t/p/w200${json['profile_path']}";
}
