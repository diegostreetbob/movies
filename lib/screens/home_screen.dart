import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:movies/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../services/movies_services.dart';
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
              onPressed: (){},
              icon:const Icon(Icons.search_outlined)
          )
        ],
      ),
      //La columna nos permite apilar widgets
      body: Column(
        children: [
          const SizedBox(height: 15),
          CardSwiper(movies: moviesProvider.onDisplayMovies),//tarjetas principales
          const SizedBox(height: 20),
          MovieSlider(popularMovies: moviesProvider.popularMovies),//Slider de películas
        ],

      ),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////