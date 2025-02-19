import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/utils/api_constants.dart';
import '../models/movie.dart';
import '../utils/api_constants.dart';

class TMDBService {
  Future<List<Movie>> getPopularMovies() async {
    try {
      final url = Uri.parse(
          '${ApiConstants.baseURl}/movie/popular?api_key=${ApiConstants.apiKey}');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data['results'] as List).map((e) => Movie.fromJson(e)).toList();
      } else {
        print(
            'Failed to fetch movies: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to fetch movies');
      }
    } catch (e) {
      print('Error occurred while fetching movies: $e');
      throw Exception('An error occurred');
    }
  }
}

class ApiConstants {}
