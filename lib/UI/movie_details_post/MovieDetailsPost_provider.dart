import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/movieDetailsPost.dart';
import 'package:flutter_movie_app/repositories/movieRepository.dart';

class MovieDetailsPostProvider extends ChangeNotifier {
  final int id;
  MovieDetailsPost posts;

  MovieRepository _movieRepository = MovieRepository();

  MovieDetailsPostProvider(this.id) {
    getPosts();
  }

  void getPosts() {
    _movieRepository.fetchMovieDetails(id).then((newPosts) {
      posts = newPosts;
      notifyListeners();
    });
  }
}
