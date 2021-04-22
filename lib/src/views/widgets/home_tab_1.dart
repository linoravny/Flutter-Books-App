import 'package:books_app/src/business_logic/models/post.dart';
import 'package:books_app/src/business_logic/providers/posts_provider.dart';
import 'package:books_app/src/views/widgets/add_post.dart';
import 'package:books_app/src/views/widgets/circular_add_post.dart';
import 'package:books_app/src/views/widgets/post_lists.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab1 extends StatefulWidget {
  @override
  _HomeTab1State createState() => _HomeTab1State();
}

class _HomeTab1State extends State<HomeTab1> {
  BuildContext dialogContext;
  int postAddedCount = 0;

  @override
  Widget build(BuildContext context) {
    postAddedCount = context.read<PostsProvider>().getUserAddedPosts.length;
    print('## postAddedCount: ' + postAddedCount.toString());
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: const Text('You Can Add only 5 posts'),
        ),
        Center(
          child: Container(
            child: Column(
              children: [
                CircularAddPost(count: postAddedCount),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: const Text('Added Post List:'),
        ),
        if (postAddedCount > 0)
          Expanded(
            child: PostList(type: 2),
          ),
        if (postAddedCount < 5)
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: FloatingActionButton(
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      dialogContext = context;
                      return AddPost();
                    },
                  ).then((_) => {
                        setState(() {}),
                      });
                },
                child: const Icon(Icons.add),
                tooltip: 'Add Post',
              ),
            ),
          ),
      ],
    );
  }
}
