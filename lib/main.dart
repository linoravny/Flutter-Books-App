import 'package:books_app/src/business_logic/providers/user_provider.dart';
import 'package:books_app/src/views/pages/books_categories.dart';
import 'package:books_app/src/views/pages/home.dart';
import 'package:books_app/src/views/pages/login_form.dart';
import 'package:books_app/theme/style.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //wrap all app in provider but only listener widget will be rebuild
    return ChangeNotifierProvider(
      create: (_) => UserData(),
      child: MaterialApp(
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
      ),
    );
  }
}
