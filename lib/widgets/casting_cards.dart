import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:movies/services/movies_services.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import 'package:flutter/cupertino.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
class CastingCard extends StatelessWidget {
  //atributos
  final Movie _movie;
  //Constructor
  const CastingCard(this._movie); //Constructor

  @override
  Widget build(BuildContext context) {
      final moviesProvider = Provider.of<MoviesService>(context, listen: false);

      return FutureBuilder(
           future: moviesProvider.getMovieCasting(_movie.id),
           builder: (_,AsyncSnapshot<Map<int, List<Cast>>> snapshot) {
             //si no hay datos se muestra ese login
             if (!snapshot.hasData) {
               return Container(
                   height: 10,
                   width: double.infinity,
                   child: const CupertinoActivityIndicator()
               );
             }
             //
             final Map<int, List<Cast>> casting= snapshot.data!;
             //
             return Container(
                 margin: const EdgeInsets.only(bottom: 10), //margen abajo
                 width: double.infinity,
                 child: ListView.builder(
                     itemCount: casting[_movie.id]?.length,
                     scrollDirection: Axis.horizontal,
                     itemBuilder: (_, int index) {
                       return _CastCard(casting[_movie.id]!.elementAt(index));//todo, seguir trabajando sobre este tipo de dato
                     }
                 ),
               );
           }
      );

  }

}

class _CastCard extends StatelessWidget {
  //atributos
  final Cast _actor;
  //Constructor
  const _CastCard(this._actor);

  @override
  Widget build(BuildContext context) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 7),
        width: 100,
        height: 200,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: FadeInImage(
                placeholder: const AssetImage("assets/images/no-image.jpg"),
                image: NetworkImage(_actor.fullProfilePath),
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(3),
              child: Text(_actor.name,
                  style: Theme.of(context).textTheme.caption,
                  overflow: TextOverflow.ellipsis,//muestra ... si falta espacio
                  maxLines: 2,
                  textAlign: TextAlign.center
              ),
            )

          ],
        ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////