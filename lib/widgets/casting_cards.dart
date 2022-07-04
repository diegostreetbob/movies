import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////
class CastingCard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
      return Container(
        margin: const EdgeInsets.only(bottom: 10),//margen abajo
        width: double.infinity,
        child: ListView.builder(
            itemCount:10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index){
              return _CastCard();
            }
        ),
    );
  }
}

class _CastCard extends StatelessWidget {

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
                placeholder: AssetImage("assets/images/no-image.jpg"),
                image: NetworkImage("https://via.placeholder.com/105x100"),
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover
              ),
            ),
            SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(3),
              child: Text("actor.name Nomen, danista, et byssus.",
                  style: Theme.of(context).textTheme.caption,
                  overflow: TextOverflow.ellipsis,//muestra ... si falta espacio
                  maxLines: 2,
                  textAlign: TextAlign.justify
              ),
            )

          ],
        ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////