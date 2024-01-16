// movie_list_widget.dart
// movie_list_widget.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflixclone/movie_controller.dart';
import 'movie_model.dart';
import 'movie_service.dart';
import 'favorite_movies_screen.dart';
import 'movie_details_screen.dart';

class MovieListWidget extends StatelessWidget {
  final MovieService _movieService = MovieService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Get.to(() => FavoriteMoviesScreen());
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Movie>>(
        future: _movieService.fetchMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Obx(() {
              final controller = Get.find<MovieController>();
              controller.setMovies(snapshot.data!);
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: controller.movies.length,
                itemBuilder: (context, index) {
                  return MovieItemWidget(movie: controller.movies[index]);
                },
              );
            });
          }
        },
      ),
    );
  }
}


class MovieItemWidget extends StatelessWidget {
  final Movie movie;

  MovieItemWidget({required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => MovieDetailsScreen(movie: movie));
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(movie.posterUrl, height: 150, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(movie.title),
            ),
          ],
        ),
      ),
    );
  }
}
