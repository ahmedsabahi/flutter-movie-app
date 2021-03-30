import 'package:flutter_movie_app/models/movieDetailsPost.dart';
import 'package:flutter_movie_app/models/movieListPost.dart';
import 'package:http/http.dart' as http;

class MovieServices {
  Future<MovieListPost> fetchMovieList() async {
    var url = Uri.parse(
        'https://api.themoviedb.org/4/discover/movie?api_key=6557d01ac95a807a036e5e9e325bb3f0&sort_by=popularity.desc');
    final response = await http.get(url);
    // print(response);
    if (response.statusCode == 200) {
      // print(response.body);
      return movieListPostFromJson(response.body);
    } else {
      throw Exception(
          'Request (Movie List) failed with status: ${response.statusCode}.');
    }
  }

  Future<MovieDetailsPost> fetchMovieDetails(int id) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/$id?api_key=6557d01ac95a807a036e5e9e325bb3f0&language=en-US');
    final response = await http.get(url);
    // print(response);
    if (response.statusCode == 200) {
      return movieDetailsPostFromJson(response.body);
    } else {
      throw Exception(
          'Request (Movie Details) failed with status: ${response.statusCode}.');
    }
  }
}
