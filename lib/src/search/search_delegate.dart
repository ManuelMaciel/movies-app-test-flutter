import 'package:flutter/material.dart';
import 'package:moviesapp/src/models/models.dart';
import 'package:provider/provider.dart';
import 'package:moviesapp/src/providers/movie_provider.dart';

class _EmptyQuery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.movie_creation_outlined, size: 130),
    );
  }
}

class MovieSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar peliculas';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("Actions");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _EmptyQuery();
    }

    final moviesProvider = Provider.of<MovieProvider>(context);

    return FutureBuilder(
      future: moviesProvider.searchMovies(query),
      builder: (_, AsyncSnapshot<List<Result>> snapshot) {
        if (!snapshot.hasData) {
          return _EmptyQuery();
        }
        final movies = snapshot.data;
        return ListView.builder(
            itemCount: movies!.length,
            itemBuilder: (_, int index) => _MovieItem(movies[index]));
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Result movie;

  const _MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    movie.heroId = 'search-${movie.id}';
    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          placeholder: AssetImage('lib/assets/no-image.jpg'),
          image: NetworkImage(movie.fullUrlPosterImage),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () => {
        Navigator.pushNamed(context, 'details', arguments: movie),
      },
    );
  }
}
