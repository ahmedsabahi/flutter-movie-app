import 'package:flutter/material.dart';
import 'package:flutter_movie_app/UI/movie_list_post/MovieListPost_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: MovieListPostScreen(),
    );
  }
}
