import 'package:flutter/material.dart';
import 'package:movies_app/home/home_layout.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeLayout.routeName : (context) => HomeLayout()
      },
      initialRoute: HomeLayout.routeName ,
      debugShowCheckedModeBanner: false,
    );
  }
}
