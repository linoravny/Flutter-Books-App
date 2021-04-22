import 'package:books_app/src/business_logic/models/post.dart';
import 'package:books_app/src/business_logic/providers/posts_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostList extends StatefulWidget {
  const PostList({
    //Key key,
    @required this.type,
  });
  //: super(key: key);

  final int type;

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  List<Post> listData = [];

  @override
  Widget build(BuildContext context) {
    if (widget.type == 2) {
      listData = context.read<PostsProvider>().getUserAddedPosts;
    } else {
      listData = context.read<PostsProvider>().getPosts;
    }
    print('******* post_list build()=> ' + listData.length.toString());

    return ListView.builder(
      itemCount: listData.length,
      itemBuilder: (context, index) {
        Post item = listData[index];
        return Dismissible(
          key: Key(item.appId),
          onDismissed: (direction) {
            // Remove the item from the data source.
            setState(() {
              context.read<PostsProvider>().deletePost(item);
            });

            // Show a snackbar. This snackbar could also contain "Undo" actions.
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("$item dismissed")));
          },
          // Show a red background as the item is swiped away.
          background: Container(
            color: Colors.red,
          ),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.comment),
                title: Text("${(index + 1).toString()} / " +
                    listData.length.toString()),
                subtitle: Text(item.title),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 15,
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
            ],
          ),
        );
      },
    );
  }
}
