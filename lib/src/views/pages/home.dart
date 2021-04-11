import 'package:books_app/src/main-shell.dart';
import 'package:books_app/src/views/widgets/add_book.dart';

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

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final pageBody = Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text('Home Page'),
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
                          Text('2/5'),
                          Text('hello, user'),
                          Text('status'),
                        ],
                      ),
                    ],
                  ),
                  totalSteps: 100,
                  currentStep: 40,
                  //roundedCap: (_, __) => true,
                  selectedStepSize: 15,
                  selectedColor: Colors.orange,
                  unselectedColor: Colors.grey[200],
                  // gradientColor: LinearGradient(
                  //   colors: [Colors.orange, Colors.grey],
                  // ),
                  width: 150,
                  height: 150,
                  padding: 0,
                  roundedCap: (index, isSelected) {
                    if (isSelected) {
                      return true;
                    }
                    return false;
                  },
                  // customStepSize: (index, isSelected) {
                  //   if (isSelected) {
                  //     return 10;
                  //   }
                  //   return 5;
                  // },

                  // selectedStepSize: 25,
                  // unselectedStepSize: 10,
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
                    return AddBook();
                  },
                );
              },
              child: Icon(Icons.add),
              tooltip: 'add custom book to your list',
            ),
          ),
        ),
      ],
    );

    return AppMainShell(widget: pageBody);
  }
}
