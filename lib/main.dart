import 'package:flutter/material.dart';
import 'package:moviesapp/src/screens/screens.dart';
import 'package:provider/provider.dart';

import 'package:moviesapp/src/providers/movie_provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MovieProvider(), lazy: false,)],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'details': (_) => const DetailsScreen(),
      },
      theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(color: Colors.deepPurpleAccent.shade700)),
    );
  }
}
