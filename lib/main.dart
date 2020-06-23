import 'package:flutter/material.dart';

import 'pages/intro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.red,
        accentColor: Colors.red,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline4: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
          headline5: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText1: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      home: IntroPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}