import 'package:dio/dio.dart';
import 'package:movie_tmdb_riverpod/data/config/environment_config.dart';
import 'package:movie_tmdb_riverpod/data/models/movie.dart';
import 'package:movie_tmdb_riverpod/data/models/movie_casts_model.dart';
import 'package:movie_tmdb_riverpod/data/models/reviews_model.dart';
import 'package:movie_tmdb_riverpod/widgets/dio/dio_exception.dart';

class MovieService {
  final EnvironmentConfig _environmentConfig;
  final Dio _dio;

  MovieService(this._environmentConfig, this._dio);

  Future<List<Movie>> getMovies(String tab) async {
    try {
      String category = "top_rated";
      switch (tab) {
        case "Now Playing":
          category = "now_playing";
          break;
        case "Upcoming":
          category = "upcoming";
          break;
        case "Popular":
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

  Future<Movie> getMoviesDetail(int id) async {
    try {
      final response = await _dio.get(
        "https://api.themoviedb.org/3/movie/$id?api_key=${_environmentConfig.movieApiKey}&language=en-US",
      );

      final results = Map<String, dynamic>.from(response.data);

      Movie movies = Movie.fromJson(results);
      return movies;
    } on DioError catch (dioError) {
      throw MoviesException.fromDioError(dioError);
    }
  }

  Future<List<ReviewsModel>> getReviewsDetail(int id) async {
    try {
      final response = await _dio.get(
        "https://api.themoviedb.org/3/movie/$id/reviews?api_key=${_environmentConfig.movieApiKey}&language=en-US&page=1",
      );
      final results = List<Map<String, dynamic>>.from(response.data['results']);
      List<ReviewsModel> reviews = results
          .map((movieData) => ReviewsModel.fromJson(movieData))
          .toList(growable: false);
      return reviews;
    } on DioError catch (dioError) {
      throw MoviesException.fromDioError(dioError);
    }
  }

  Future<List<MovieCastModel>> getCastDetail(int id) async {
    try {
      final response = await _dio.get(
        "https://api.themoviedb.org/3/movie/$id/credits?api_key=${_environmentConfig.movieApiKey}&language=en-US",
      );
      final results = List<Map<String, dynamic>>.from(response.data['cast']);
      List<MovieCastModel> casts = results
          .map((movieData) => MovieCastModel.fromJson(movieData))
          .toList(growable: false);
      return casts;
    } on DioError catch (dioError) {
      throw MoviesException.fromDioError(dioError);
    }
  }

  // Future<List<Movie>> getSearchMovieDetails(String query) async {
  //   List<Movie> movies = [];
  //   if (query.isNotEmpty) {
  //     final apiDatas = await _dio.get(
  //       "https://api.themoviedb.org/3/search/movie?api_key=${_environmentConfig.movieApiKey}&language=en-US&query=$query&page=1",
  //     );

  //     for (final apiData in apiDatas.data["results"]) {
  //       if (movies.length == 3) {
  //         break;
  //       }
  //       Movie movie = await getMoviesDetail(apiData["id"]);
  //       movies.add(movie);
  //     }
  //   }
  //   return movies;
  // }

  Future<List<Movie>> getSearchMovieDetails(query) async {
    List<Movie> movies = [];
    // List<Movie> searchList = [];

    if (query.isNotEmpty) {
      final apiDatas = await _dio.get(
        "https://api.themoviedb.org/3/search/movie?api_key=${_environmentConfig.movieApiKey}&language=en-US&query=$query&page=1",
      );
      for (final apiData in apiDatas.data["results"]) {
        // Movie searchData = Movie.fromJson(apiData);
        // searchList.add(searchData);
        if (movies.length == 5) {
          break;
        }
        Movie movie = await getMoviesDetail(apiData["id"]);
        movies.add(movie);
      }
    }
    return movies;
  }
}
