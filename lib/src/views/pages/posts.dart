import 'package:books_app/src/business_logic/models/post.dart';
import 'package:books_app/src/business_logic/providers/posts_provider.dart';
import 'package:books_app/src/business_logic/services/main_service_api.dart';
import 'package:books_app/src/main-shell.dart';
import 'package:books_app/src/views/widgets/add_post.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostPage extends StatefulWidget {
  static const routeName = '/PostPage';

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Post> postData = [];
  List<Post> userAddedPostData = [];
  bool _isLoading = false;
  int postAddedCount = 0;

  HttpService apiService = new HttpService();

  @override
  initState() {
    print('_______PostPage initState()');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // befor build run
    setState(() {
      _isLoading = true;
    });

    context
        .read<PostsProvider>()
        .fetchAndsetPosts()
        .then(
          (_) => {
            print('fetchAndsetPosts then'),
            setState(() {
              print('fetchAndsetPosts then _isLoading = false');
              _isLoading = false;
            }),
          },
        )
        .catchError((onError) => {
              print('fetchAndsetPosts onError'),
            });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    postData = context.read<PostsProvider>().getPosts;
    userAddedPostData = context.read<PostsProvider>().getUserAddedPosts;
    postAddedCount = userAddedPostData.length;

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

    final pageHeader = AppBar(
      leading: (postAddedCount < 5)
          ? IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'add post',
              onPressed: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AddPost();
                  },
                ).then((_) => {
                      setState(() {}),
                    });
              },
            )
          : null,
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      title: const Text('Posts'),
    );

    final pageBody = Container(
      child: (_isLoading)
          ? _buildProgressIndicator()
          : ListView.builder(
              itemCount: postData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.comment),
                      title: Text("$index / " + postData.length.toString()),
                      subtitle: Text(postData[index].title),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 15,
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                  ],
                );
              },
            ),
    );
    return ChangeNotifierProvider<PostsProvider>(
      create: (_) => PostsProvider(),
      child: AppMainShell(
        widget: pageBody,
        customAppHeader: pageHeader,
      ),
    );
  }
}
