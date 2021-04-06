import 'package:books_app/src/business_logic/models/user.dart';
import 'package:books_app/src/views/pages/books_categories.dart';
import 'package:books_app/src/views/pages/home.dart';
import 'package:books_app/src/views/pages/login_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'business_logic/providers/user_provider.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(
      context,
    ).userData;
    final isUserAuth = (userData != null) ? userData.isAuth : false;

    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text("app menu"),
          ),
          if (!isUserAuth)
            (ListTile(
              leading: Icon(Icons.login, size: 18),
              title: Text('Login'),
              onTap: () => {
                Navigator.pushNamed(
                  context,
                  LoginForm.routeName,
                ),
              },
            )),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {
              Navigator.pushNamed(
                context,
                Home.routeName,
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Books'),
            onTap: () => {
              Navigator.pushNamed(
                context,
                BookCategories.routeName,
              )
            },
          ),
          if (isUserAuth)
            (ListTile(
              leading: Icon(Icons.logout, size: 18),
              title: Text('Logout'),
              onTap: () => {
                Provider.of<UserData>(
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
