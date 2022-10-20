import 'package:dio/dio.dart';
import 'package:movie_tmdb_riverpod/data/config/environment_config.dart';
import 'package:movie_tmdb_riverpod/data/models/movie.dart';
import 'package:movie_tmdb_riverpod/widgets/dio/dio_exception.dart';

class MovieService {
  final EnvironmentConfig _environmentConfig;
  final Dio _dio;

  MovieService(this._environmentConfig, this._dio);

  Future<List<Movie>> getMovies(String tab) async {
    try {
      String category = "top_rated";
      switch(tab){
        case "Now Playing" :
          category = "now_playing";
          break;
        case "Upcoming" :
          category = "upcoming";
          break;
        case "Popular" :
          category = "popular";
      }
      final response = await _dio.get(
        "https://api.themoviedb.org/3/movie/$category?api_key=${_environmentConfig.movieApiKey}&language=en-US&page=1",
      );

      final results = List<Map<String, dynamic>>.from(response.data['results']);

      List<Movie> movies = results
          .map((movieData) => Movie.fromJson(movieData))
          .toList(growable: false);
      return movies;
    } on DioError catch (dioError) {
      throw MoviesException.fromDioError(dioError);
    }
  }
}
