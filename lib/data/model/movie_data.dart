// To parse this JSON data, do
//
//     final moviesDataListModel = moviesDataListModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MoviesDataListModel moviesDataListModelFromMap(String str) =>
    MoviesDataListModel.fromMap(json.decode(str));

String moviesDataListModelToMap(MoviesDataListModel data) =>
    json.encode(data.toMap());

class MoviesDataListModel {
  MoviesDataListModel({
    required this.movies,
  });

  final List<Movie> movies;

  factory MoviesDataListModel.fromMap(Map<String, dynamic> json) =>
      MoviesDataListModel(
        movies: List<Movie>.from(json["movies"].map((x) => Movie.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "movies": List<dynamic>.from(movies.map((x) => x.toMap())),
      };
}

class Movie {
  Movie({
    required this.backdrop,
    required this.cast,
    required this.classification,
    required this.director,
    required this.genres,
    required this.id,
    required this.imdbRating,
    required this.length,
    required this.overview,
    required this.poster,
    required this.releasedOn,
    required this.slug,
    required this.title,
  });

  final String backdrop;
  final List<String> cast;
  final String classification;
  final dynamic director;
  final List<String> genres;
  final String id;
  final double imdbRating;
  final String length;
  final String overview;
  final String poster;
  final DateTime releasedOn;
  final String slug;
  final String title;

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        backdrop: json["backdrop"],
        cast: List<String>.from(json["cast"].map((x) => x)),
        classification: json["classification"],
        director: json["director"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        id: json["id"],
        imdbRating: json["imdb_rating"].toDouble(),
        length: json["length"],
        overview: json["overview"],
        poster: json["poster"],
        releasedOn: DateTime.parse(json["released_on"]),
        slug: json["slug"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "backdrop": backdrop,
        "cast": List<dynamic>.from(cast.map((x) => x)),
        "classification": classification,
        "director": director,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "id": id,
        "imdb_rating": imdbRating,
        "length": length,
        "overview": overview,
        "poster": poster,
        "released_on": releasedOn.toIso8601String(),
        "slug": slug,
        "title": title,
      };
}
