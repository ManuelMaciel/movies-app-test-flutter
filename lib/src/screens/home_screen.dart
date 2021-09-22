import 'package:flutter/material.dart';
import 'package:moviesapp/src/widgets/card_swiper.dart';
import 'package:moviesapp/src/widgets/widgets.dart';

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
      body: SingleChildScrollView(
        child: Column(
        children: const [
          // CardSwiper
          CardSwiper(),
          // listado horizontal de peliculas
          MovieSlider(),
          
        ],
      ),
      )
    );
  }
}
