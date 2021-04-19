import 'package:books_app/src/views/pages/book_categories.dart';
import 'package:books_app/src/views/pages/fav_book_list.dart';
import 'package:books_app/src/views/pages/home.dart';
import 'package:books_app/src/views/pages/login_form.dart';
import 'package:books_app/src/views/pages/posts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'business_logic/providers/user_provider.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserProvider>(
      context,
    ).userData;
    final isUserAuth = (userData != null) ? userData.isAuth : false;

    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: const Text("app menu"),
          ),
          if (!isUserAuth)
            (ListTile(
              leading: const Icon(Icons.login, size: 18),
              title: const Text('Login'),
              onTap: () => {
                Navigator.pushNamed(
                  context,
                  LoginForm.routeName,
                ),
              },
            )),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => {
              Navigator.pushNamed(
                context,
                Home.routeName,
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Books Categories'),
            onTap: () => {
              Navigator.pushNamed(
                context,
                BookCategories.routeName,
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.comment),
            title: const Text('Posts'),
            onTap: () => {
              Navigator.pushNamed(
                context,
                PostPage.routeName,
              )
            },
          ),
          if (isUserAuth)
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('My favorit books'),
              onTap: () => {
                Navigator.pushNamed(
                  context,
                  FavoriteUserBookList.routeName,
                )
              },
            ),
          if (isUserAuth)
            (ListTile(
              leading: const Icon(Icons.logout, size: 18),
              title: const Text('Logout'),
              onTap: () => {
                Provider.of<UserProvider>(
                  context,
                  listen: false,
                ).setUserData(null)
              },
            )),
        ],
      ),
    );
  }
}
