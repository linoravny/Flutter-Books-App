import 'package:books_app/src/business_logic/models/post.dart';
import 'package:books_app/src/business_logic/providers/posts_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final _formKey = GlobalKey<FormState>();
  final _titleProvider = FocusNode();
  Post _post;
  var uuid = Uuid();

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
        context.read<PostsProvider>().addNewPost(_post).then(
              (res) => {
                ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('Added successfuly :) '),
                )),
                Navigator.of(context).pop()
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
      contentPadding: const EdgeInsets.all(0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(15),
            child: InkResponse(
              onTap: () {
                Navigator.pop(context, true);
              },
              child: CircleAvatar(
                child: const Icon(Icons.close),
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
                    const Text('Add Post'),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'post title',
                          prefixIcon: Icon(Icons.title),
                          border: OutlineInputBorder(),
                          //labelStyle: TextStyle(color: Colors.grey),
                        ),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (_) {
                          saveForm();
                        },
                        onSaved: (value) {
                          _post = Post(
                            appId: uuid.v1(),
                            title: value,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        child: const Text("Add"),
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
