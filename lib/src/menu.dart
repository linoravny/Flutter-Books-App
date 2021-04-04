import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text("app menu"),
          ),
          ListTile(
            leading: Icon(Icons.login, size: 18),
            title: Text('Login'),
            onTap: () => {
              Navigator.pushNamed(
                context,
                '/login',
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {
              Navigator.pushNamed(
                context,
                '/home',
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Books'),
            onTap: () => {
              Navigator.pushNamed(
                context,
                '/book-categories',
              )
            },
          ),
        ],
      ),
    );
  }
}
