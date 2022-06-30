import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
class AppTheme {
  //colores primarios para cada tema, como atributos privados
  static const Color _primaryLight = Colors.lightBlueAccent;
  static const Color _primaryDark = Colors.white70;
  //getters
  static Color get primaryLight => _primaryLight;
  static Color get primaryDark => _primaryDark;
  //Thema light personalizado
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: _primaryLight, //color primario
      appBarTheme: const AppBarTheme(color: _primaryLight, elevation: 0), //appbar
      iconTheme: const IconThemeData(color: Colors.green), //Color inonos sueltos
      listTileTheme: const ListTileThemeData(
          iconColor: Colors.lightBlueAccent), //Color iconos dentro de ListTile
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: _primaryLight)), //Stylo de los botones
      //Stilo tarjetas
      cardTheme: CardTheme(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 15),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: _primaryLight,
          elevation: 5
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: _primaryLight,
              shape: const StadiumBorder(),
              elevation: 0
          )
      ),
      inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: _primaryLight),
          //se aplica a todos los imputs que no tengan el focus y estén habilitados
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
          //se aplica a los imputs habilitados
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          //se aplica a los imputs que tienen el foco
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: _primaryLight),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          //se aplica a los imputs que han arrojado algún error.
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey),
              borderRadius: BorderRadius.all(Radius.circular(10))
          )
      )
  );
  //Thema dark personalizado
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: _primaryDark, //color primario
      appBarTheme: const AppBarTheme(
        //appBar
          color: _primaryDark,
          elevation: 0),
      //Color inonos sueltos
      iconTheme: const IconThemeData(color: Colors.green),
      //Color iconos dentro de ListTile
      listTileTheme: const ListTileThemeData(iconColor: Colors.lightBlueAccent),
      //fondo del scaffold
      scaffoldBackgroundColor: Colors.black,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: _primaryLight)), //Stylo de los botones
      //Stilo tarjetas
      cardTheme: CardTheme(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 15),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: _primaryDark,
          elevation: 5
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: _primaryDark,
              shape: const StadiumBorder(),
              elevation: 0
          )
      )
  );
}
////////////////////////////////////////////////////////////////////////////////////////////////////