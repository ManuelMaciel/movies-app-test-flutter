import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:moviesapp/src/models/models.dart';

class MovieProvider extends ChangeNotifier {
  final String _apiKey = 'b2ca972e881717a97e3b1a0bab689add';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Result> onDisplayMovies = [];
  List<Result> popularMovies = [];

  MovieProvider() {
    print('Movie provider inicializado');
    getOnNowPlayingMovies();
    getPopularMovies();
  }

  getOnNowPlayingMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });
    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }
}
