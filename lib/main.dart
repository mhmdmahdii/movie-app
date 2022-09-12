import 'package:flutter/material.dart';
import 'package:movies_app/Modules/movies_filtred.dart';
import 'package:movies_app/home/home_layout.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeLayout.routeName : (context) => HomeLayout(),
        MoviesFiltred.routeName : (context) => MoviesFiltred()
      },
      initialRoute: HomeLayout.routeName ,
      debugShowCheckedModeBanner: false,
    );
  }
}
