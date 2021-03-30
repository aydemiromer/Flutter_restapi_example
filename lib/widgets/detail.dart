import 'package:flutter/material.dart';
import 'package:flutter_rest_api_films/models/restapi.dart';

class MoviesDetail extends StatelessWidget {
  final List<Movie> movies;

  MoviesDetail({this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];

          return ListTile(
              title: Row(
            children: [
              SizedBox(
                width: 100,
                child: Image.network(movie.poster),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(movie.title), Text(movie.year)],
                  ),
                ),
              )
            ],
          ));
        });
  }
}
