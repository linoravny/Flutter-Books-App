import 'package:flutter/material.dart';
import './src/app.dart';
import './theme/style.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App',
      theme: appTheme(),
      home: App(),
    );
  }
}
