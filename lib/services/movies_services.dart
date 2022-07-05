import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movies/models/models.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
class MoviesService extends ChangeNotifier{
  //atributos
  final String _baseUrl  = "api.themoviedb.org";
  final String _apiEnd   = "3/movie/now_playing";
  final String _apiKey   = "5fe5efe957ab22167841b4e432fe5d30";
  final String _language = "es-ES";
  final String _page     = "1";

  //Constructor
  MoviesService(){
    print("Movies Service inicializado");
    this.getOnDisplayMovies();
  }
  //Operaciones
  getOnDisplayMovies() async{
    var url = Uri.https(this._baseUrl, this._apiEnd,
        { //mismo parámetros que se envian con postman
          "api_key" : this._apiKey,
          "language": this._language,
          "page"    : this._page
        }
    );
    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    print(nowPlayingResponse.results[0].title);

  }


}
////////////////////////////////////////////////////////////////////////////////////////////////////