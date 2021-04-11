import 'package:books_app/src/business_logic/models/post.dart';
import 'package:books_app/src/business_logic/services/main_service_api.dart';
import 'package:books_app/src/main-shell.dart';

import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  static const routeName = '/PostPage';

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Post> postData = [];
  HttpService apiService = new HttpService();
  void _getPosts() {
    apiService.fetchAppPosts().then((response) {
      setState(() {
        postData = response;
        print(postData[0].title);
      });
    });
  }

  @override
  initState() {
    _getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildProgressIndicator() {
      return new Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.orange,
          ),
        ),
      );
    }

    final pageBody = Container(
      child: (postData.length == 0)
          ? _buildProgressIndicator()
          : ListView.builder(
              itemCount: postData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("$index: " + postData[index].title),
                );
              },
            ),
    );
    return AppMainShell(widget: pageBody);
  }
}
