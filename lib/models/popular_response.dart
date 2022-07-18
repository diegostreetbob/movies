/*
Este código ha sido generado automáticamente por https://app.quicktype.io/ a la cual se le ha pegado
el Json respuesta que nos ha dado Postman
https://api.themoviedb.org/3/movie/popular?api_key=5fe5efe957ab22167841b4e432fe5d30&language=es-ES&page=1
*/
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'dart:convert';
import 'package:movies/models/models.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
class PopularResponse {
  PopularResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory PopularResponse.fromJson(String str) => PopularResponse.fromMap(json.decode(str));

  factory PopularResponse.fromMap(Map<String, dynamic> json) => PopularResponse(
    page: json["page"],
    results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

}
////////////////////////////////////////////////////////////////////////////////////////////////////