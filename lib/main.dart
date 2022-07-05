import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:movies/screens/screens.dart';
import 'package:movies/services/movies_services.dart';
import 'package:movies/themes/app_theme.dart';
import 'package:provider/provider.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
void main() => runApp(AppState());//ojo primero llamamos a los providers
////////////////////////////////////////////////////////////////////////////////////////////////////
//acceso a los proveedores de servicios, capa de servicios, de modo que se se está haciendo, en toda
//el arbol de widgets hay acceso a los datos proporcionados por la clase de servicio que tengamos en
//providers
class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [//ponemos las clases de servicio
          ChangeNotifierProvider(
              create: (_) => MoviesService(),
              lazy: false,//MoviesService se instancia de inicio
           // lazy: true//MoviesService se instancia cuando un componente lo reclama
          )
        ],
        child: MyApp()//llamamos a la app en si
    );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      initialRoute: "home",
      routes: {
        "home": (_)=>const HomeScreen(),
        "details":(_)=>const DetailsScreen()
      },
      theme: AppTheme.lightTheme,
      //theme: AppTheme.darkTheme,
    );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////