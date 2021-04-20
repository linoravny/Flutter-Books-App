import 'package:flutter/material.dart';

Map<int, Color> colorMainOrange = {
  50: Color.fromRGBO(255, 120, 11, .1),
  100: Color.fromRGBO(255, 120, 11, .2),
  200: Color.fromRGBO(255, 120, 11, .3),
  300: Color.fromRGBO(255, 120, 11, .4),
  400: Color.fromRGBO(255, 120, 11, .5),
  500: Color.fromRGBO(255, 120, 11, .6),
  600: Color.fromRGBO(255, 120, 11, .7),
  700: Color.fromRGBO(255, 120, 11, .8),
  800: Color.fromRGBO(255, 120, 11, .9),
  900: Color.fromRGBO(255, 120, 11, 1),
};
MaterialColor mColorOrange = MaterialColor(0xffff780b, colorMainOrange);

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'QuickSand',
    primarySwatch: mColorOrange,

    // textTheme: ThemeData.light().textTheme.copyWith(
    //     bodyText1: TextStyle(
    //       color: Color.fromRGBO(20, 51, 51, 1),
    //     ),
    //     bodyText2: TextStyle(
    //       color: Color.fromRGBO(20, 51, 51, 1),
    //     ),
    //     headline6: TextStyle(
    //       fontSize: 20,
    //     )),
    //primaryColor: Colors.pink,
    // accentColor: Colors.white,
    // canvasColor: Color.fromRGBO(255, 254, 229, 1),
    // hintColor: Colors.white,
    // dividerColor: Colors.white,
    // buttonColor: Colors.white,
    //scaffoldBackgroundColor: Colors.white,
  );
}

// use: Colors
// Theme.of(context) - in build methode
