import 'package:books_app/src/business_logic/models/book.dart';
import 'package:books_app/src/main-shell.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostPage extends StatefulWidget {
  static const routeName = '/PostPage';

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  //'https://www.googleapis.com/books/v1/volumes?q=search+terms'
//https://jsonplaceholder.typicode.com/comments

  List<Book> growableLis;

  void _getPostPage() async {
    // API.getUsers().then((response) {
    //   setState(() {
    //     Iterable list = json.decode(response.body);
    //     growableLis = list.map((model) => dynamic.fromJson(model)).toList();
    //   });
    // });
  }

  @override
  initState() {
    _getPostPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageBody = Container();

    return AppMainShell(widget: pageBody);
  }
}
