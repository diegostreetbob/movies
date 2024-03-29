/*
Este código ha sido generado automáticamente por https://app.quicktype.io/ a la cual se le ha pegado
el Json respuesta que nos ha dado Postman
*/
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'dart:convert';
////////////////////////////////////////////////////////////////////////////////////////////////////
class Movie {
  //atributos
  final String _posterImgUrl = "https://image.tmdb.org/t/p/w500";
  //
  Movie({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  String? releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
    adult           : json["adult"],
    backdropPath    : json["backdrop_path"],
    genreIds        : List<int>.from(json["genre_ids"].map((x) => x)),
    id              : json["id"],
    originalLanguage: json["original_language"],
    originalTitle   : json["original_title"],
    overview        : json["overview"],
    popularity      : json["popularity"].toDouble(),
    posterPath      : json["poster_path"],
    releaseDate     : json["release_date"],
    title           : json["title"],
    video           : json["video"],
    voteAverage     : json["vote_average"].toDouble(),
    voteCount       : json["vote_count"],
  );
  //getter
  String get posterImgUrl{
    if(posterPath != null){
      return _posterImgUrl+posterPath!;
    }else{
      return "https://via.placeholder.com/300x400";
    }
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////