import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:movies/widgets/widgets.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
class DetailsScreen extends StatelessWidget {

  const DetailsScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      //TODO: Cambiar mas adelante por una instancia de  movie

      //Queremos que siempre venta un argumento del tipo String y en caso de que no venga lo sustitu
     //imos por No movie
      final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? "No movie";
      return Scaffold(
        body:CustomScrollView(
          slivers: [ //no todos los tipos de wodgets son admitidos, solo los válidos como Slivers
            _CustomAppBar(),
            SliverFixedExtentList(
              itemExtent: 200.0,//alto filas del los elementos de scroll
              delegate: SliverChildListDelegate(
                [
                  _PosterAndTitle(),
                  _OverView(),
                  _OverView(),
                  _OverView(),
                  CastingCard()
                ],
              ),
            )
          ]
        )
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return const SliverAppBar(
        backgroundColor: Colors.indigo,
        expandedHeight: 200,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text("movie.title"),
          titlePadding: EdgeInsets.all(0),//quitamos el padding
          background: FadeInImage(
              placeholder: AssetImage("assets/images/loading.gif"),
              image: NetworkImage("https://via.placeholder.com/500x300"),
              fit: BoxFit.cover//para que se expanda donde está contenida
          ),
        ),

      );
  }
}

class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FadeInImage(
              placeholder: AssetImage("assets/images/no-image.jpg"),
              image: NetworkImage("https://via.placeholder.com/200x300"),
              height: 150,//forzamos tamaño y evitamos efector extraños por la diferencia de size
              //entre la img de placeholder y la de image
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Movie Title",style: Theme.of(context).textTheme.headline5,overflow: TextOverflow.ellipsis, maxLines: 2),
              Text("Original Movie Title",style: Theme.of(context).textTheme.headline6,overflow: TextOverflow.ellipsis, maxLines: 1),
              Row(
                children: [
                  Icon(
                      Icons.star,
                      size: 15,
                      color: Colors.yellow,
                  ),
                  SizedBox(width: 5),
                  Text("movie.average",style: Theme.of(context).textTheme.caption)
                ],
              )
            ],
          )
        ],
      ),

    );
  }
}

class _OverView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20) ,
        child: Text("Wobble without modification, and we won’t question a cosmonaut."
            "Dozens of aliens imitate united, ancient spaces.The girl is more processor now than "
            "space. proud and wildly vital.C-beams are the teleporters of the human resistance."
            "The tribble malfunctions energy like a collective vogon."
            "Engage, honor!Where is the quirky proton?When the dosi dies for hyperspace, all sensors "
            "translate ugly, galactic transformators.",
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.subtitle1,
            overflow: TextOverflow.ellipsis,//muestra ... si falta espacio
            maxLines: 8,
        )
      );
  }
}


////////////////////////////////////////////////////////////////////////////////////////////////////