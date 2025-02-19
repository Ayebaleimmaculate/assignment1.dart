import 'package:flutter/material.dart';
import 'api_service.dart';
import 'movie.dart';

class MovieScreen extends StatefulWidget {
  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  late Future<Movie?> futureMovie;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    futureMovie = apiService.fetchLatestMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Latest Movie')),
      body: FutureBuilder<Movie?>(
        future: futureMovie,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final movie = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(movie.overview),
                  SizedBox(height: 10),
                  Text('Release Date: ${movie.releaseDate}'),
                  SizedBox(height: 10),
                  Text('Rating: ${movie.voteAverage}'),
                ],
              ),
            );
          } else {
            return Center(child: Text('No movie data available.'));
          }
        },
      ),
    );
  }
}
