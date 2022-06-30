import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:movies/screens/screens.dart';
import 'package:movies/themes/app_theme.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
void main() => runApp(MyApp());

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