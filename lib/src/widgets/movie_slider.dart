import 'package:flutter/material.dart';
import 'package:moviesapp/src/models/models.dart';

class MovieSlider extends StatelessWidget {
  final List<Result> movies;
  final String? title;

  const MovieSlider({
    Key? key,
    required this.movies,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (movies.length == 0) {
      return Container(
        width: double.infinity,
        height: 250,
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.deepPurple.shade400,
            color: Colors.deepPurpleAccent.shade700,
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // check if title exist
          if (title != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(title!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),

          SizedBox(),

          Expanded(
            child: GlowingOverscrollIndicator(
              color: Colors.deepPurpleAccent.shade700,
              axisDirection: AxisDirection.left,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) =>
                    _MoviePoster(movies[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Result movie;

  const _MoviePoster(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      // color: Colors.blueAccent.shade400,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movie-poster-details'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage(
                placeholder: AssetImage('lib/assets/no-image.jpg'),
                image: NetworkImage(movie.fullUrlPosterImage),
                fit: BoxFit.cover,
                width: 130,
                height: 150,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
