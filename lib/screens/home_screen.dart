import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:movies/widgets/widgets.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
class HomeScreen extends StatelessWidget {

  const HomeScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
          title: const Center(
              child: Text("Películas en cines")
          ),
        actions: [
          IconButton(
              onPressed: (){},
              icon:const Icon(Icons.search_outlined)
          )
        ],
      ),
      //La columna nos permite apilar widgets
      body: Column(
        children: [
          CardSwiper()
        ],

      ),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////