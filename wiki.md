# Wiki

## Error

======== Exception caught by rendering library =====================================================
The following assertion was thrown during performResize():
Vertical viewport was given unbounded height.

Viewports expand in the scrolling direction to fill their container. In this case, a vertical viewport was given an unlimited amount of vertical space in which to expand. This situation typically happens when a scrollable widget is nested inside another scrollable widget.

If this widget is always nested in a scrollable widget there is no need to use a viewport because there will always be enough vertical space for the children. In this case, consider using a Column instead. Otherwise, consider using the "shrinkWrap" property (or a ShrinkWrappingViewport) to size the height of the viewport to the sum of the heights of its children.

----------------

En anterior error es causado porque el `ListView.builder` define su ancho basado en el padre, en este caso no sabe cual tiene que tener porque su padre `Column` es flexible por lo que se usa el Widget ´Expanded´

```dart
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
        height: screenDim.height*0.3,//x% de la pantalla, va en unión con el mismo parámetro del
        //cardswiper
        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(//Padding par ael texto
              padding: EdgeInsets.symmetric(horizontal: 20),
              child:Text("Populares")
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (_, int index){
                    return Container(
                      width: 130,
                      height: 130,
                      color: Colors.green,
                    );
                  },
              ),
            )
          ],
        ),
      );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////
```

