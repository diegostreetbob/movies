/*
Este código ha sido generado automáticamente por https://app.quicktype.io/ a la cual se le ha pegado
el Json respuesta que nos ha dado Postman
https://api.themoviedb.org/3/search/movie?api_key=5fe5efe957ab22167841b4e432fe5d30&language=es-ES&page=1&query=Batman
*/
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'dart:convert';
import 'package:movies/models/models.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
class SearchResponse {
  SearchResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory SearchResponse.fromJson(String str) => SearchResponse.fromMap(json.decode(str));

  factory SearchResponse.fromMap(Map<String, dynamic> json) => SearchResponse(
    page: json["page"],
    results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

}
////////////////////////////////////////////////////////////////////////////////////////////////////