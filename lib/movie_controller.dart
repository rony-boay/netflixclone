// movie_controller.dart
import 'package:get/get.dart';
import 'movie_model.dart';

class MovieController extends GetxController {
  final RxList<Movie> movies = <Movie>[].obs;

  void setMovies(List<Movie> movieList) {
    movies.assignAll(movieList);
  }

  void toggleFavorite(Movie movie) {
    movie.isFavorite = !movie.isFavorite;
    update();
  }
}
