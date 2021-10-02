import 'package:flutter/material.dart';
import 'package:moviesapp/src/widgets/widgets.dart';
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String movieInstance =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
              delegate:
                  SliverChildListDelegate([
                    _PosterAndTitle(), 
                    _Overview(),
                    CastingCard()
                  ]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

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
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            "movie.title",
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          image: NetworkImage("https://via.placeholder.com/500x300"),
          placeholder: AssetImage("lib/assets/loading.gif"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('lib/assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/150x200'),
              height: 200,
            ),
          ),
          // Space
          SizedBox(width: 20),
          // END Space
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Start wars",
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                "Start wars",
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                children: [
                  Icon(Icons.star_outline, size: 20, color: Colors.grey),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '4/5',
                    style: textTheme.caption,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce faucibus cursus tempor. Pellentesque quam risus, vulputate sed tempor at, aliquet et neque. Nulla non purus massa. Fusce semper, massa aliquam mattis consequat, orci lacus sodales est, id viverra lacus justo id turpis. Sed placerat luctus aliquet. Suspendisse semper massa at sapien vestibulum, eu gravida nunc vestibulum. Donec facilisis, nisl ac blandit sollicitudin, ipsum nisi venenatis augue, sit amet aliquet erat purus non libero. Mauris tincidunt sapien eu neque vehicula, quis consequat dolor consequat. Nunc orci ligula, laoreet vitae elit non, eleifend imperdiet odio. Donec sit amet ipsum nec arcu lacinia sollicitudin. Sed in nunc nec leo tempus sollicitudin. Phasellus vehicula, urna a blandit venenatis, mauris nibh iaculis nibh, nec iaculis purus dolor varius leo. Proin volutpat auctor tincidunt. Maecenas ultrices dignissim lectus, sit amet posuere est varius non.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
