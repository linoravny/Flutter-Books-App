import 'package:books_app/src/main-shell.dart';
import 'package:books_app/src/views/widgets/add_post.dart';

import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BuildContext dialogContext;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int postAddedCount = 0;
    final pageBody = Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text('You can add $postAddedCount new post'),
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
                );
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
