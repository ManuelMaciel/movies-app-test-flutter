import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class MovieProvider extends ChangeNotifier {
  String _apiKey = 'b2ca972e881717a97e3b1a0bab689add';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  MovieProvider() {
    print('Movie provider inicializado');
    this.getOnNowPlayingMovies();
  }
  getOnNowPlayingMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });
    final response = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(response.body);
    print(response.body);
  }
}
