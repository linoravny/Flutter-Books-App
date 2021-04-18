import 'package:books_app/src/business_logic/models/post.dart';
import 'package:books_app/src/business_logic/providers/posts_provider.dart';
import 'package:books_app/src/main-shell.dart';
import 'package:books_app/src/views/widgets/add_post.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BuildContext dialogContext;
  List<Post> userAddedPostData = [];
  int postAddedCount = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    userAddedPostData = context.read<PostsProvider>().getUserAddedPosts;

    postAddedCount = userAddedPostData.length;

    final pageBody = Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text('You Can Add only 5 posts'),
        ),
        Center(
          child: Container(
            child: Column(
              children: [
                CircularStepProgressIndicator(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('$postAddedCount/5'),
                          Text('hello, user'),
                        ],
                      ),
                    ],
                  ),
                  totalSteps: 100,
                  currentStep: postAddedCount * 20,
                  selectedStepSize: 15,
                  selectedColor: Colors.orange,
                  unselectedColor: Colors.grey[200],
                  width: 150,
                  height: 150,
                  padding: 0,
                  roundedCap: (index, isSelected) {
                    if (isSelected) {
                      return true;
                    }
                    return false;
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text('Added Post List:'),
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
                  //open modal:
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
                child: Icon(Icons.add),
                tooltip: 'Add Post',
              ),
            ),
          ),
      ],
    );

    return AppMainShell(widget: pageBody);
  }
}
