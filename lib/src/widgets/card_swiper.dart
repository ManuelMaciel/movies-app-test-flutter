import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/src/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Result> movies;

  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
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
      height: size.height * 0.5,
      // color: Colors.deepPurple.shade400,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemHeight: size.height * 0.4,
        itemWidth: size.width * 0.6,
        itemBuilder: (BuildContext context, int index) {
          final movie = movies[index];

          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('lib/assets/no-image.jpg'),
                image: NetworkImage(movie.fullUrlPosterImage),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
