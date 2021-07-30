import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // navigatorKey: Modular.navigatorKey,
      title: 'Aplicação',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          caption: TextStyle(color: Colors.white),
        ),
        primaryColor: Colors.grey[700],
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.deepPurpleAccent[500],
        ),
        appBarTheme: AppBarTheme(
          color: Colors.grey[800],
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey[800],
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey[800],
        ),
        accentColor: Colors.deepPurpleAccent[900],
        canvasColor: Colors.grey[50],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      // onGenerateRoute: Modular.generateRoute,
    ).modular();
  }
}
