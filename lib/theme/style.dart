import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: Colors.pink,
    accentColor: Colors.white,
    canvasColor: Color.fromRGBO(255, 254, 229, 1),
    textTheme: ThemeData.light().textTheme.copyWith(
        bodyText1: TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1),
        ),
        bodyText2: TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1),
        ),
        headline6: TextStyle(
          fontSize: 20,
        )),
    hintColor: Colors.white,
    dividerColor: Colors.white,
    buttonColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.orange,
    fontFamily: 'QuickSand',
  );
}
