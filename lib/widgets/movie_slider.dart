import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////
class MovieSlider extends StatelessWidget {

  const MovieSlider ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final screenDim = MediaQuery.of(context).size;//tamaño de la pantalla
      return Container(
        width: double.infinity,//para que ocupe todo el ancho
        height: screenDim.height*0.30,//x% de la pantalla, va en unión con el mismo parámetro del
        //cardswiper
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(//Padding para el texto
              padding: EdgeInsets.symmetric(horizontal: 20),
              child:Text("Populares",style: TextStyle(fontWeight: FontWeight.bold))
            ),
            const SizedBox(height: 5),
            _MoviePoster()
          ],
        ),
      );
  }
}

class _MoviePoster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (_, int index){
            return Container(
              width: 130,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: ()=>Navigator.pushNamed(context, "details",arguments: "movie-instance"),
                    child: ClipRRect(//para ponerle bordes redondeados
                      borderRadius: BorderRadius.circular(18),
                      child: const FadeInImage(
                          placeholder: AssetImage("assets/images/no-image.jpg"),
                          image: NetworkImage("https://via.placeholder.com/300x400"),
                        width: 130,
                        height: 148,
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                      "Terminator: El juicio final y la rebelión de las máquinas",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,//muestra ... como que falta texto
                      textAlign: TextAlign.justify,
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