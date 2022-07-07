import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:card_swiper/card_swiper.dart';
import 'package:movies/models/models.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
class CardSwiper extends StatelessWidget {
  //Atributos
  final List<Movie> movies;
  //Constructor
  const CardSwiper ({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      //
      final screenDim = MediaQuery.of(context).size;//tamaño de la pantalla
      //Muestra circulo de carga mientra llegan los datos del servicio rest
      if(movies.isEmpty){
        return SizedBox(
          width: double.infinity,
          height: screenDim.height * 0.2,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }else {
        return Container(
        width: double.infinity,//todo el ancho de la pantalla
        height: screenDim.height*0.48,//x% de la pantalla
          //color: Colors.red,
        child: Swiper(
          itemCount: movies.length,
          layout: SwiperLayout.STACK,
          itemWidth: screenDim.width*0.6,
          itemHeight: screenDim.height*0.9,
          itemBuilder: (_,int index){
            final movie = movies[index];
            return GestureDetector(
              onTap: ()=>Navigator.pushNamed(context, "details",arguments: "movie-instance"),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: FadeInImage(
                    placeholder: const AssetImage("assets/images/no-image.jpg"),
                    image: NetworkImage(movie.posterImgUrl),
                    fit: BoxFit.contain,//adapta el tamaño al del contenedor padre
                ),
              ),
            );
          },


        ),

      );
      }
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////
