import 'package:flutter/material.dart';
import 'package:flutter_movie_app/UI/movie_details_post/MovieDetailsPost_screen.dart';
import 'package:flutter_movie_app/models/movieListPost.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key key,
    @required this.movieList,
  }) : super(key: key);

  final Result movieList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MovieDetailsPostScreen(
                  id: movieList.id,
                )));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Hero(
                  tag: movieList.id,
                  child: Container(
                    width: 80,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500${movieList.posterPath}',
                          ),
                        )),
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movieList.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Original language: ${movieList.originalLanguage}',
                    ),
                    Text(
                      'Release year: ${movieList.releaseDate.year}',
                    ),
                    // Text(
                    //   'Release year: ${movie.overview}',
                    // ),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: movieList.voteAverage / 2,
                          itemCount: 5,
                          itemSize: 20.0,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                        Text('${movieList.voteAverage.toString()}/10')
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
