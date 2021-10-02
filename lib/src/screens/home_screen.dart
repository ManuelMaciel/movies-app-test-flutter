import 'package:flutter/material.dart';
import 'package:moviesapp/src/providers/movie_provider.dart';
import 'package:moviesapp/src/widgets/card_swiper.dart';
import 'package:moviesapp/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Movies"),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // CardSwiper
              CardSwiper(movies: movieProvider.onDisplayMovies),
              // listado horizontal de peliculas
              MovieSlider(
                movies: movieProvider.popularMovies,
                title: "Populares",
              ),
            ],
          ),
        ));
  }
}
