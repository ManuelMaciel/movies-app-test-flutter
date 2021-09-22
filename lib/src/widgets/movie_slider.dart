import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      // color: Colors.deepPurpleAccent.shade700,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Populares',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          Expanded(
            child: GlowingOverscrollIndicator(
              color: Colors.deepPurpleAccent.shade700,
              axisDirection: AxisDirection.left,
              child: ListView.builder(              
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) => _MoviePoster()
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      // color: Colors.blueAccent.shade400,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          _MovieImage()
        ],
      ),
    );
  }
}


class _MovieImage extends StatelessWidget {
  const _MovieImage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-poster-details'),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage("https://via.placeholder.com/300x400"),
              fit: BoxFit.cover,
              width: 130,
              height: 150,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Star Wars 2 ',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
