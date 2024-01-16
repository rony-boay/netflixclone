// movie_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie_model.dart';

class MovieService {
  final String apiKey =
      "75be0e3812098c0f5e12c10c2bf334b7"; // Replace with your actual API key

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((item) => Movie.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
