import 'package:books_app/src/business_logic/models/post.dart';
import 'package:books_app/src/business_logic/providers/posts_provider.dart';
import 'package:books_app/src/views/widgets/add_post.dart';
import 'package:books_app/src/views/widgets/circular_add_post.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab1 extends StatefulWidget {
  @override
  _HomeTab1State createState() => _HomeTab1State();
}

class _HomeTab1State extends State<HomeTab1> {
  BuildContext dialogContext;
  List<Post> userAddedPostData = [];
  int postAddedCount = 0;

  @override
  Widget build(BuildContext context) {
    userAddedPostData = context.read<PostsProvider>().getUserAddedPosts;
    postAddedCount = userAddedPostData.length;

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
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: userAddedPostData.length,
              itemBuilder: (context, index) {
                final item = userAddedPostData[index];

                return Column(
                  children: [
                    Dismissible(
                      key: Key(item.appId),
                      onDismissed: (direction) {
                        // Remove the item from the data source.
                        setState(() {
                          context
                              .read<PostsProvider>()
                              .deleteUserAddedPost(item);
                        });

                        // Show a snackbar. This snackbar could also contain "Undo" actions.
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("$item dismissed")));
                      },
                      // Show a red background as the item is swiped away.
                      background: Container(
                        color: Colors.red,
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.comment),
                            title: Text(item.title),
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
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
