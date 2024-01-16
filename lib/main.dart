// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflixclone/movie_controller.dart';
import 'movie_list_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie App',
      home: MovieListWidget(),
      initialBinding: BindingsBuilder(() {
        Get.put(MovieController()); // Register MovieController
      }),
    );
  }
}
