import 'package:flutter/material.dart';
import 'package:moviesapp/src/providers/movie_provider.dart';
import 'package:moviesapp/src/search/search_delegate.dart';
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
          centerTitle: true,
          title: const Text(
            "Movies",
            textAlign: TextAlign.center,
          ),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate()),
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
                onNextPage: () => movieProvider.getPopularMovies(),
              ),
              SizedBox(
                height: 10,
              ),
              MovieSlider(
                movies: movieProvider.upComingMovies,
                title: "Proximamente",
                onNextPage: () => movieProvider.getUpCommingMovies(),
              ),
            ],
          ),
        ));
  }
}
