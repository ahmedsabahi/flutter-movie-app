import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/movieListPost.dart';
import 'package:flutter_movie_app/repositories/movieRepository.dart';

class MovieListPostProvider extends ChangeNotifier {
  MovieListPost posts;

  MovieRepository _movieRepository = MovieRepository();

  MovieListPostProvider() {
    getPosts();
  }

  void getPosts() {
    _movieRepository.fetchMovieList().then((newPosts) {
      posts = newPosts;
      notifyListeners();
    });
  }
}
