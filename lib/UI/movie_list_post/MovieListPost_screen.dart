import 'package:flutter/material.dart';
import 'package:flutter_movie_app/UI/movie_list_post/MovieListPost_provider.dart';
import 'package:flutter_movie_app/widgets/cardWidget.dart';
import 'package:provider/provider.dart';

class MovieListPostScreen extends StatelessWidget {
  const MovieListPostScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: ChangeNotifierProvider<MovieListPostProvider>(
        create: (context) => MovieListPostProvider(),
        child: Consumer<MovieListPostProvider>(
          builder: (buildContext, movieListPostProvider, _) {
            return (movieListPostProvider.posts != null &&
                    movieListPostProvider.posts.results != null)
                ? ListView.builder(
                    itemCount: movieListPostProvider.posts.results.length,
                    itemBuilder: (ctx, index) {
                      final movieList =
                          movieListPostProvider.posts.results[index];
                      return CardWidget(movieList: movieList);
                    },
                  )
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
