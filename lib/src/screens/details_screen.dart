import 'package:flutter/material.dart';
import 'package:moviesapp/src/models/models.dart';
import 'package:moviesapp/src/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Result movie = ModalRoute.of(context)!.settings.arguments as Result;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(customAppBar: movie),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitle(posterAndTitle: movie),
                _Overview(overview: movie),
                CastingCard(movie.id)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Result customAppBar;
  const _CustomAppBar({Key? key, required this.customAppBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      backgroundColor: Colors.deepPurpleAccent.shade700,
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(0),
        centerTitle: true,
        title: Container(
          width: double.infinity,
          color: Colors.black12,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: Text(
            customAppBar.title,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          image: NetworkImage(customAppBar.fullUrlPosterImage),
          placeholder: const AssetImage("lib/assets/loading.gif"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Result posterAndTitle;
  const _PosterAndTitle({Key? key, required this.posterAndTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('lib/assets/no-image.jpg'),
              image: NetworkImage(posterAndTitle.fullUrlPosterImage),
              height: 150,
              width: 110,
            ),
          ),
          // Space
          const SizedBox(width: 20),
          // END Space
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  posterAndTitle.title,
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  posterAndTitle.originalTitle,
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    const Icon(Icons.star_outline,
                        size: 20, color: Colors.grey),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      posterAndTitle.voteAverage.toString(),
                      style: textTheme.caption,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Result overview;
  const _Overview({Key? key, required this.overview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        overview.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
