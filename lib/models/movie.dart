import 'package:flutter_movie_app/models/genre.dart';
import 'package:movie_app/models/genre.dart';

class Movie {
  final int? id;
  final String? title;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final List<Genre>? genres;

  Movie({
    this.id,
    this.title,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.genres,
  });

  // Convert JSON to Movie object
  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        genres: (json['genres'] as List<dynamic>?)
                ?.map((genre) => Genre.fromJson(genre))
                .toList() ??
            [],
      );

  // Convert Movie object to JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'genres': genres?.map((genre) => genre.toJson()).toList(),
      };
}

class Video {
  final String? id;
  final String? key;
  final String? name;
  final String? site;

  Video({this.id, this.key, this.name, this.site});

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json['id'],
        key: json['key'],
        name: json['name'],
        site: json['site'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'key': key,
        'name': name,
        'site': site,
      };
}

class Image {
  final String? filePath;
  final double? aspectRatio;

  Image({this.filePath, this.aspectRatio});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        filePath: json['file_path'],
        aspectRatio: (json['aspect_ratio'] as num?)?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        'file_path': filePath,
        'aspect_ratio': aspectRatio,
      };
}
