import 'package:books_app/src/business_logic/providers/posts_provider.dart';
import 'package:books_app/src/business_logic/providers/user_provider.dart';
import 'package:books_app/src/views/pages/book_categories.dart';
import 'package:books_app/src/views/pages/fav_book_list.dart';
import 'package:books_app/src/views/pages/home.dart';
import 'package:books_app/src/views/pages/login_form.dart';
import 'package:books_app/src/views/pages/posts.dart';
import 'package:books_app/theme/style.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //wrap all app in provider but only listener widget will be rebuild

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider<PostsProvider>(
          create: (_) => PostsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Books App',
        theme: appTheme(),
        home: Home(),
        routes: {
          LoginForm.routeName: (context) => LoginForm(),
          Home.routeName: (context) => Home(),
          BookCategories.routeName: (context) => BookCategories(),
          PostPage.routeName: (context) => PostPage(),
          FavoriteUserBookList.routeName: (context) => FavoriteUserBookList(),
          // '/': (context) => LoginForm(),
          // '/home': (context) => Home(),
          // '/login': (context) => LoginForm(),
          // '/book-categories': (context) => BookCategories(),
        },
      ),
    );
  }
}
