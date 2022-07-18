/*
Este código ha sido generado automáticamente por https://app.quicktype.io/ a la cual se le ha pegado
el Json respuesta que nos ha dado Postman
https://api.themoviedb.org/3/movie/now_playing?api_key=5fe5efe957ab22167841b4e432fe5d30&language=es-ES&page=1
*/
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'dart:convert';
import 'package:movies/models/models.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
class NowPlayingResponse {
  //Constructor
  NowPlayingResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
  //Atributos
  Dates dates;
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;
  //
  factory NowPlayingResponse.fromJson(String str) => NowPlayingResponse.fromMap(json.decode(str));


  factory NowPlayingResponse.fromMap(Map<String, dynamic> json) => NowPlayingResponse(
    dates       : Dates.fromMap(json["dates"]),
    page        : json["page"],
    results     : List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
    totalPages  : json["total_pages"],
    totalResults: json["total_results"],
  );

}

class Dates {
  Dates({
    required this.maximum,
    required this.minimum,
  });

  DateTime maximum;
  DateTime minimum;

  factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dates.fromMap(Map<String, dynamic> json) => Dates(
    maximum: DateTime.parse(json["maximum"]),
    minimum: DateTime.parse(json["minimum"]),
  );

  Map<String, dynamic> toMap() => {
    "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
    "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
  };
}
////////////////////////////////////////////////////////////////////////////////////////////////////