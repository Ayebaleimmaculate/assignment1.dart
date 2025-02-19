import 'package:fluter_movie_app/models/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part " genre.g.dart";

@JsonSerializable()
class Genre {4
  final int? id;
  final String? name;

  Genre({required this.id, required this.name});

  static Movie fromJson(genre) {}

  //factory Genre.fromJson(Map<String, dynamic> json) => Genre(
  //      id: json['id'],
  //     name: json['name'],
  //   );
}
