import 'dart:convert';

import 'package:moviesapp/src/models/models.dart';

class SearchMovieResponse {
  SearchMovieResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory SearchMovieResponse.fromJson(String str) =>
      SearchMovieResponse.fromMap(json.decode(str));

  factory SearchMovieResponse.fromMap(Map<String, dynamic> json) =>
      SearchMovieResponse(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
