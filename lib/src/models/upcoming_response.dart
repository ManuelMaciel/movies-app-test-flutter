// To parse this JSON data, do
//
//     final nowPlayingResponse = nowPlayingResponseFromMap(jsonString);

import 'dart:convert';

import 'package:moviesapp/src/models/models.dart';

class UpComingResponse {
  UpComingResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory UpComingResponse.fromJson(String str) =>
      UpComingResponse.fromMap(json.decode(str));

  factory UpComingResponse.fromMap(Map<String, dynamic> json) =>
      UpComingResponse(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
