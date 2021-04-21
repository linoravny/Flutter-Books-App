import 'package:books_app/theme/colors.dart';
import 'package:flutter/material.dart';

MColocs colors = new MColocs();
MaterialColor mColorOrange =
    MaterialColor(colors.orangeMainHexColor, colors.swatchMainMapColor);

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
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 5,
      shadowColor: colors.orangeMainColor,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    ),
    scaffoldBackgroundColor: colors.greyLightColor,
  );
}

// use: Colors
// Theme.of(context) - in build methode
