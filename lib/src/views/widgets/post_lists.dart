import 'package:books_app/src/business_logic/models/post.dart';
import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  const PostList({
    Key key,
    @required this.postData,
  }) : super(key: key);

  final List<Post> postData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
