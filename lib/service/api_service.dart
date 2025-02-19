import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie.dart';

class ApiService {
  final String apiKey = 'YOUR_API_KEY'; // Replace with your actual API key
  final String baseUrl =
      'https://api.themoviedb.org/3/movie/latest'; // Example endpoint

  Future<Movie?> fetchLatestMovie() async {
    final response = await http.get(Uri.parse('$baseUrl?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return Movie.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movie');
    }
  }
}
