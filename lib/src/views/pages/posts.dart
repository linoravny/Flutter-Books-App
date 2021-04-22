import 'package:books_app/src/business_logic/models/post.dart';
import 'package:books_app/src/business_logic/providers/posts_provider.dart';
import 'package:books_app/src/business_logic/services/main_service_api.dart';
import 'package:books_app/src/menu.dart';
import 'package:books_app/src/views/widgets/add_post.dart';
import 'package:books_app/src/views/widgets/post_lists.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostPage extends StatefulWidget {
  static const routeName = '/PostPage';

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Post> userAddedPostData = [];
  bool _isLoading = false;
  int postAddedCount = 0;

  HttpService apiService = new HttpService();

  @override
  void didChangeDependencies() {
    print('PostPage didChangeDependencies()');
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

  Widget _buildAppBar(context) {
    return AppBar(
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
      iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      title: const Text('Posts'),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('PostPage build()');
    return Scaffold(
      endDrawer: Menu(),
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Container(
          child: (_isLoading) ? _buildProgressIndicator() : PostList(type: 1),
        ),
      ),
    );
  }
}
