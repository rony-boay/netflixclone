// favorite_movies_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflixclone/movie_controller.dart';
import 'movie_model.dart';
import 'movie_details_screen.dart';

class FavoriteMoviesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Movies'),
      ),
      body: GetX<MovieController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.movies.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.movies[index].title),
                onTap: () {
                  Get.to(() => MovieDetailsScreen(
                      movie: controller.movies[index]));
                },
              );
            },
          );
        },
      ),
    );
  }
}
