import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////
class MovieSlider extends StatelessWidget {
  //Atributos
  final List<Movie> popularMovies;
  //
  const MovieSlider ({Key? key, required this.popularMovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final screenDim = MediaQuery.of(context).size;//tamaño de la pantalla
      //Muestra circulo de carga mientra llegan los datos del servicio rest
      if(popularMovies.isEmpty){
        return Container(
          width: double.infinity,
          height: screenDim.height * 0.5,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }else {
        return Container(
        width: double.infinity,//para que ocupe todo el ancho
        height: screenDim.height*0.34,//x% de la pantalla, va en unión con el mismo parámetro del
        //cardswiper
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(//Padding para el texto
              padding: EdgeInsets.symmetric(horizontal: 20),
              child:Text("Populares",style: TextStyle(fontWeight: FontWeight.bold))
            ),
            const SizedBox(height: 5),
            _MoviePoster(popularMovies: popularMovies)
          ],
        ),
      );
      }
  }
}

class _MoviePoster extends StatelessWidget {
  //Atributos
  final List<Movie> popularMovies;
  //
  const _MoviePoster ({Key? key, required this.popularMovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: popularMovies.length,
          itemBuilder: (_, int index){
            final movie = popularMovies[index];
            return Container(
              //color: Colors.red,
              width: 115,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: ()=>Navigator.pushNamed(context, "details",arguments: "movie-instance"),
                    child: ClipRRect(//para ponerle bordes redondeados
                      borderRadius: BorderRadius.circular(25),
                      child: FadeInImage(
                          placeholder: const AssetImage("assets/images/no-image.jpg"),
                          image: NetworkImage(movie.posterImgUrl),
                          width: 140,
                          height: 160,
                          fit: BoxFit.contain
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Text(
                        movie.overview,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,//muestra ... como que falta texto
                        textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            );
          },
      ),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////