import 'dart:convert';
import 'package:fluter_movie_app/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:fluter_movie_app/models/genre.dart';

class GenreService {
  final String baseUrl =
      "https://api.example.com"; // Replace with actual API URL

  // Fetch all genres
  Future<List<Movie>> fetchGenres() async {
    final response = await http.get(Uri.parse('$baseUrl/genres'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((genre) => Genre.fromJson(genre)).toList();
    } else {
      throw Exception("Failed to load genres");
    }
  }
}
