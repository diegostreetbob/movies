import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:movies/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../services/movies_services.dart';
import 'package:movies/search/search_delegate.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
class HomeScreen extends StatelessWidget {

  const HomeScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      //uso del provider que se redibuja cuando haya alguna notificación
      final moviesProvider = Provider.of<MoviesService>(context);

      return Scaffold(
      appBar: AppBar(
          title: const Center(
              child: Text("Películas en cines")
          ),
        actions: [
          IconButton(
              icon:const Icon(Icons.search_outlined),
              onPressed: ()=>showSearch(
                  context: context,
                  delegate: MovieSearchDelegate()
              ),
          )
        ],
      ),
      //La columna nos permite apilar widgets
      body: Column(
        children: [
          CardSwiper(movies: moviesProvider.onDisplayMovies),//tarjetas principales
          MovieSlider(
              popularMovies: moviesProvider.popularMovies,
              onNextPage:()=>moviesProvider.getPopularMovies()
          ),//Slider de películas
        ],

      ),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////