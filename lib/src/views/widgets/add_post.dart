import 'package:books_app/src/business_logic/models/post.dart';
import 'package:books_app/src/business_logic/providers/posts_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final _formKey = GlobalKey<FormState>();
  final _titleProvider = FocusNode();
  Post _post;

  @override
  void dispose() {
    _titleProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void saveForm() {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Processing Data...'),
        ));

        print(
          'title: ' + _post.title,
        );

        Provider.of<PostsProvider>(
          context,
          listen: false,
        ).addNewPost(_post).then(
              (res) => {
                ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Added successfuly :) '),
                )),
                Provider.of<PostsProvider>(
                  context,
                  listen: false,
                ).setCounter(5.8),
                Navigator.of(context).pop(),
              },
            );
      } else {
        //validation fail
      }
    }

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      contentPadding: EdgeInsets.all(0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15),
            child: InkResponse(
              onTap: () {
                Navigator.pop(context, true);
              },
              child: CircleAvatar(
                child: Icon(Icons.close),
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Add Post'),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'post title',
                          prefixIcon: Icon(Icons.title),
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(color: Colors.grey),
                        ),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (_) {
                          saveForm();
                        },
                        onSaved: (value) {
                          _post = Post(
                            title: value,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        child: Text("Add"),
                        onPressed: () {
                          saveForm();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
