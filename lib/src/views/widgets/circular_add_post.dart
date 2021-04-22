import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CircularAddPost extends StatefulWidget {
  final int count;

  CircularAddPost({@required this.count});

  @override
  _CircularAddPostState createState() => _CircularAddPostState();
}

class _CircularAddPostState extends State<CircularAddPost> {
  @override
  Widget build(BuildContext context) {
    int _count = widget.count;
    return CircularStepProgressIndicator(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$_count/5'),
              const Text('hello, user'),
            ],
          ),
        ],
      ),
      totalSteps: 100,
      currentStep: _count * 20,
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
    );
  }
}
