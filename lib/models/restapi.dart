class Movie {
  final String imbdId;
  final String poster;
  final String title;
  final String year;

  Movie({this.imbdId, this.poster, this.title, this.year});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        imbdId: json["imdbID"],
        poster: json["Poster"],
        title: json["Title"],
        year: json["Year"]);
  }
}
