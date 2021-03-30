import 'dart:convert';
import 'package:flutter_rest_api_films/widgets/detail.dart';
import 'package:flutter_rest_api_films/models/restapi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Movie> _movies = List<Movie>();

  @override
  void initState() {
    super.initState();
    _populateAllMovies();
  }

  void _populateAllMovies() async {
    final movies = await _fetchAllMovies();
    setState(() {
      _movies = movies;
    });
  }

  //FETCH Data
  Future<List<Movie>> _fetchAllMovies() async {
    final response = await http
        .get("http://www.omdbapi.com/?s=Batman&page=2&apikey=564727fa");

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["Search"];
      return list.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Failed!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(child: Text('Batman Movies')),
        ),
        body: MoviesDetail(movies: _movies),
      ),
    );
  }
}
