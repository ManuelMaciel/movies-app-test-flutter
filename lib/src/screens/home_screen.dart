import 'package:flutter/material.dart';
import 'package:moviesapp/src/widgets/card_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Icon( Icons.search ),
          ),
        ],
      ),
      body: Column(
        children: [
          // TODO: CardSwiper
          CardSwiper()
          // listado horizontal de peliculas
        ],
      )
    );
  }
}
