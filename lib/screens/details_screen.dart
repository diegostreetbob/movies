import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:movies/widgets/widgets.dart';
import 'package:movies/models/models.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
class DetailsScreen extends StatelessWidget {
  const DetailsScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      //Recibimos una película y forzamos a que la trate como Movie, hemos de estar seguros de
      //que siempre recibiremos una instancia de Movie
      final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
      print(movie.title);
      return Scaffold(
        body:CustomScrollView(
          slivers: [ //no todos los tipos de wodgets son admitidos, solo los válidos como Slivers
            _CustomAppBar(movie),
            SliverFixedExtentList(
              itemExtent: 200.0,//alto filas del los elementos de scroll
              delegate: SliverChildListDelegate(
                [
                  _PosterAndTitle(movie),
                  _OverView(movie),
                  CastingCard(movie)
                ],
              ),
            )
          ]
        )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  //Atributos
  final Movie movie;
  //Constructor
  const _CustomAppBar(this.movie);

  @override
  Widget build(BuildContext context) {
      return SliverAppBar(
        backgroundColor: Colors.indigo,
        expandedHeight: 500,
        collapsedHeight: 100,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          //title: Text(this.title),
          titlePadding: const EdgeInsets.all(0),//quitamos el padding
          background: FadeInImage(
              placeholder: const AssetImage("assets/images/loading.gif"),
              image: NetworkImage(movie.posterImgUrl),
              fit: BoxFit.cover//para que se expanda donde está contenida
          ),
        ),

      );
  }
}

class _PosterAndTitle extends StatelessWidget {
  //atributos
  final Movie movie;
  //Constructor
  const _PosterAndTitle(this.movie); //Constructor
  //
  @override
  Widget build(BuildContext context) {
    final screenDim = MediaQuery.of(context).size;//tamaño de la pantalla
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FadeInImage(
              placeholder: const AssetImage("assets/images/no-image.jpg"),
              image: NetworkImage(movie.posterImgUrl),
              height: 200,//forzamos tamaño y evitamos efector extraños por la diferencia de size
              width: 120,
              fit: BoxFit.cover
              //entre la img de placeholder y la de image
            ),
          ),
          const SizedBox(width: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: screenDim.width-180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    movie.title,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3
                ),
                Text(
                    movie.originalTitle,
                    style: Theme.of(context).textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3
                ),
                Row(
                  children: [
                    for(int i = 0;i<movie.voteAverage;i++)
                      const Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.yellow,
                      ),
                     const SizedBox(width: 5),
                    Text("${movie.voteAverage}",style: Theme.of(context).textTheme.caption)
                  ],
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}

class _OverView extends StatelessWidget {
  //Atributos
  final Movie movie;


  const _OverView(this.movie);

  @override
  Widget build(BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 11) ,
        child: Text(
            movie.overview,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.headline6,
            overflow: TextOverflow.ellipsis,//muestra ... si falta espacio
            maxLines: 8,
        )
      );
  }
}


////////////////////////////////////////////////////////////////////////////////////////////////////