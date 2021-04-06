import 'package:books_app/src/views/pages/books_categories.dart';
import 'package:books_app/src/views/pages/home.dart';
import 'package:books_app/src/views/pages/login_form.dart';
import 'package:books_app/theme/style.dart';

import 'package:flutter/material.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App',
      theme: appTheme(),
      home: LoginForm(),
      //initialRoute: '/',
      routes: {
        LoginForm.routeName: (context) => LoginForm(),
        Home.routeName: (context) => Home(),
        BookCategories.routeName: (context) => BookCategories(),
        // '/': (context) => LoginForm(),
        // '/home': (context) => Home(),
        // '/login': (context) => LoginForm(),
        // '/book-categories': (context) => BookCategories(),
      },
    );
  }
}
