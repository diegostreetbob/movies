import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:http/http.dart' as http;
import 'package:movies/models/models.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
class MoviesService extends ChangeNotifier{
  //atributos
  //https://api.themoviedb.org/3/movie/now_playing?api_key=5fe5efe957ab22167841b4e432fe5d30&language=es-ES&page=1
  //https://api.themoviedb.org/3/movie/popular?api_key=5fe5efe957ab22167841b4e432fe5d30&language=es-ES&page=1
  final String _baseUrl  = "api.themoviedb.org";
  final String _apiEndOnDisplayMovies   = "3/movie/now_playing";
  final String _apiEndPopularMovies   = "3/movie/popular";
  final String _apiKey   = "5fe5efe957ab22167841b4e432fe5d30";
  final String _language = "es-ES";
  final String _page     = "1";
  int _polularPage = 0;
  //
  List<Movie> onDisplayMovies = [];//inicializado como listado vacio al que tendremos acceso desde
  //cualquier parte ya que la clase extiende de ChangeNotifier
  List<Movie> popularMovies = [];//inicializado como listado vacio al que tendremos acceso desde
  //cualquier parte ya que la clase extiende de ChangeNotifier
  //Constructor
  MoviesService(){
    print("Movies Service inicializado");
    getOnDisplayMovies();
    getPopularMovies();
  }
  //Operaciones
  //peliculas en cartelera actualmente
  getOnDisplayMovies() async{
    final response = await _getJsonData(_apiEndOnDisplayMovies, 1, _apiKey, _language);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response);
    //
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();//notifica a los listeners implicados que se redibujen
  }
  //Peliculas populares
  getPopularMovies() async{
    _polularPage++;
    final response = await _getJsonData(_apiEndPopularMovies, _polularPage, _apiKey, _language);
    final popularResponse = PopularResponse.fromJson(response);
    //
    popularMovies = popularResponse.results;
    //operador spread, concatena el nuevo contenido al existente
    popularMovies = [...popularMovies,...popularResponse.results];
    notifyListeners();//notifica a los listeners implicados que se redibujen
  }
  //método privado utilitario
  Future<String> _getJsonData(String apiEnd,int page,String apiKey, String language) async{
    var url = Uri.https(this._baseUrl, apiEnd,
        { //mismo parámetros que se envian con postman
          "api_key" : apiKey,
          "language": language,
          "page"    : "$page"//conversión a string
        }
    );
    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }


}
////////////////////////////////////////////////////////////////////////////////////////////////////