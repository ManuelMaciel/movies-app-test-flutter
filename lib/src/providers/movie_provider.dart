import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:moviesapp/src/models/models.dart';
import 'package:moviesapp/src/models/upcoming_response.dart';

class MovieProvider extends ChangeNotifier {
  final String _apiKey = 'b2ca972e881717a97e3b1a0bab689add';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Result> onDisplayMovies = [];
  List<Result> popularMovies = [];
  List<Result> upComingMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  int _popularMoviesPage = 0;
  int _upComingMoviesPages = 0;

  MovieProvider() {
    print('Movie provider inicializado');
    getOnNowPlayingMovies();
    getPopularMovies();
    getUpCommingMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });
    // await the http response
    final response = await http.get(url);
    return response.body;
  }

  getOnNowPlayingMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');

    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    _popularMoviesPage++;

    final jsonData = await _getJsonData('3/movie/popular', _popularMoviesPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];
    print(popularMovies);
    print(_popularMoviesPage);
    notifyListeners();
  }

  getUpCommingMovies() async {
    _upComingMoviesPages++;

    final jsonData =
        await _getJsonData('3/movie/upcoming', _upComingMoviesPages);
    final upComingResponse = PopularResponse.fromJson(jsonData);

    upComingMovies = [...upComingMovies, ...upComingResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    final jsonData = await this._getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditResponse.fromJson(jsonData);
    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }
}
