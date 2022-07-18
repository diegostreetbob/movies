/*
Este código ha sido generado automáticamente por https://app.quicktype.io/ a la cual se le ha pegado
el Json respuesta que nos ha dado Postman
https://api.themoviedb.org/3/movie/453395/credits?api_key=5fe5efe957ab22167841b4e432fe5d30&language=es-ES&page=1
*/
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'dart:convert';
////////////////////////////////////////////////////////////////////////////////////////////////////
class CastingResponse {
  //Atributos
  int id;
  List<Cast> cast;
  List<Cast> crew;
  //Constructor
  CastingResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory CastingResponse.fromJson(String str) => CastingResponse.fromMap(json.decode(str));

  factory CastingResponse.fromMap(Map<String, dynamic> json) => CastingResponse(
    id: json["id"],
    cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
    crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
  );

}

class Cast {
  //Atributos
  final String _imgPath = "https://image.tmdb.org/t/p/w500";
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String? profilePath;
  int? castId;
  String? character;
  String creditId;
  int? order;
  String? department;
  String? job;
  //Constructor
  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    required this.creditId,
    this.order,
    this.department,
    this.job,
  });

  factory Cast.fromJson(String str) => Cast.fromMap(json.decode(str));

  factory Cast.fromMap(Map<String, dynamic> json) => Cast(
    adult: json["adult"],
    gender: json["gender"],
    id: json["id"],
    knownForDepartment: json["known_for_department"],
    name: json["name"],
    originalName: json["original_name"],
    popularity: json["popularity"].toDouble(),
    profilePath: json["profile_path"] == null ? null : json["profile_path"],
    castId: json["cast_id"] == null ? null : json["cast_id"],
    character: json["character"] == null ? null : json["character"],
    creditId: json["credit_id"],
    order: json["order"] == null ? null : json["order"],
    department: json["department"] == null ? null : json["department"],
    job: json["job"] == null ? null : json["job"],
  );
  //getter
  String get fullProfilePath{
    if(profilePath != null){
      return _imgPath+profilePath!;
    }else{
      return "https://via.placeholder.com/100x200";
    }
  }

}
////////////////////////////////////////////////////////////////////////////////////////////////////