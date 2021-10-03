import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/src/models/models.dart';
import 'package:moviesapp/src/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class CastingCard extends StatelessWidget {
  final int movieId;
  const CastingCard(this.movieId);

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);

    return FutureBuilder(
      future: movieProvider.getMovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            height: 180,
            constraints: const BoxConstraints(maxWidth: 150),
            child: const CupertinoActivityIndicator(),
          );
        }

        final List<Cast> cast = snapshot.data!;

        return Container(
          margin: EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 180,
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.right,
            color: Colors.deepPurpleAccent.shade700,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cast.length,
                itemBuilder: (BuildContext context, int index) =>
                    _CastCard(cast[index])),
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final Cast cast;

  const _CastCard(this.cast);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              image: NetworkImage(cast.fullUrlprofilePath),
              placeholder: AssetImage("lib/assets/loading.gif"),
              width: 100,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            cast.originalName,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          // Text(
          //   cast.knownForDepartment,
          //   style: TextStyle(
          //     overflow: TextOverflow.ellipsis,
          //   ),
          //   textAlign: TextAlign.center,
          //   maxLines: 2,
          // )
        ],
      ),
    );
  }
}
