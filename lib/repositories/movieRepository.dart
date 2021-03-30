import 'package:flutter_movie_app/models/movieDetailsPost.dart';
import 'package:flutter_movie_app/models/movieListPost.dart';
import 'package:flutter_movie_app/services/movieServices.dart';

class MovieRepository {
  MovieServices _movieRepository = MovieServices();
  Future<MovieListPost> fetchMovieList() {
    return _movieRepository.fetchMovieList();
  }

  Future<MovieDetailsPost> fetchMovieDetails(int id) {
    return _movieRepository.fetchMovieDetails(id);
  }
}
