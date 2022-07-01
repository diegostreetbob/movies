import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:card_swiper/card_swiper.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
class CardSwiper extends StatelessWidget {
  const CardSwiper ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final screenDim = MediaQuery.of(context).size;//tamaño de la pantalla

      return Container(
        width: double.infinity,//todo el ancho de la pantalla
        height: screenDim.height*0.53,//x% de la pantalla
        child: Swiper(
          itemCount: 10,
          layout: SwiperLayout.STACK,
          itemWidth: screenDim.width*0.6,
          itemHeight: screenDim.height*0.9,
          itemBuilder: (_,int index){
            return GestureDetector(
              onTap: ()=>Navigator.pushNamed(context, "details",arguments: "argumentos"),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20) ,
                child: const FadeInImage(
                    placeholder: AssetImage("assets/images/no-image.jpg"),
                    image: NetworkImage("https://via.placeholder.com/300x400"),
                    fit: BoxFit.cover,//adapta el tamaño al del contenedor padre
                ),
              ),
            );
          },


        ),

      );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////
