import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('books List'),
        ),
        body: Container(
          child: Center(
            child: Text('books list'),
          ),
        ));
  }
}
