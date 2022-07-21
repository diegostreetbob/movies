import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:movies/models/movie.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
class MovieSlider extends StatelessWidget {
  //Atributos
  final List<Movie> popularMovies;
  final Function onNextPage;
  //
  const MovieSlider ({Key? key, required this.popularMovies,required this.onNextPage}) : super(key: key);

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
        //color: Colors.green,
        width: double.infinity,//para que ocupe todo el ancho
        height: screenDim.height*0.28,//x% de la pantalla, va en unión con el mismo parámetro del
        //cardswiper
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(//Padding para el texto
              padding: EdgeInsets.symmetric(horizontal: 20),
              child:Text("Populares",style: TextStyle(fontWeight: FontWeight.bold))
            ),
            const SizedBox(height: 1),
            _MoviePoster(popularMovies: popularMovies,onNextPage: onNextPage)
          ],
        ),
      );
      }
  }
}

class _MoviePoster extends StatefulWidget {
  //Atributos
  final List<Movie> popularMovies;
  final Function onNextPage;

  const _MoviePoster ({Key? key, required this.popularMovies,required this.onNextPage}) : super(key: key);

  @override
  State<_MoviePoster> createState() => _MoviePosterState();
}

class _MoviePosterState extends State<_MoviePoster> {
  final ScrollController scrollController = ScrollController();

  //al ser un statefull widget, este código se ejecutar una sola vez, cuando el widget es construido
  @override
  void initState(){
    super.initState();
    //creamos listener con el scrollcontroller
    scrollController.addListener(() {
      if(scrollController.position.pixels>=scrollController.position.maxScrollExtent-800){
        print("refrescando scroll, llamando al provider");
        widget.onNextPage();
      }
    });
  }
  //Se ejecuta cuando el widget va a ser destruido
  @override
  void dispose(){
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
         controller: scrollController,//para unir con el ScrollController
          scrollDirection: Axis.horizontal,
          itemCount: widget.popularMovies.length,//widget. lo ha añadido solo al convertir a statefull
          itemBuilder: (_, int index){
            final movie = widget.popularMovies[index];//widget. lo ha añadido solo al convertir a statefull
            return Container(
              width: 110,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: ()=>Navigator.pushNamed(context, "details",arguments: movie),
                    child: ClipRRect(//para ponerle bordes redondeados
                      borderRadius: BorderRadius.circular(15),
                      child: FadeInImage(
                          placeholder: const AssetImage("assets/images/no-image.jpg"),
                          image: NetworkImage(movie.posterImgUrl),
                          height: 150,
                          fit: BoxFit.fill
                      ),
                    ),
                  ),
                SizedBox(
                  width: 100,
                  child: Text(
                    movie.overview,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, //muestra ... como que falta texto
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