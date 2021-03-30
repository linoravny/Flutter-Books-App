import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../src/views/pages/books_categories.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final pageBody = SafeArea(
    child: SingleChildScrollView(
      child: BookCategories(),
    ),
  );

  File _image;
  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        // Platform.isIOS
        //   ? CupertinoPageScaffold(
        //       navigationBar: CupertinoNavigationBar(
        //         backgroundColor: CupertinoColors.systemGrey.withOpacity(0.8),
        //         middle: const Text('Books App'),
        //       ),
        //       child: Column(
        //         children: <Widget>[pageBody],
        //       ),
        //     )
        //   :
        Scaffold(
      appBar: AppBar(
        title: const Text('Books App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.camera_alt_sharp),
            tooltip: 'Open Device Camera',
            onPressed: () {
              _imgFromCamera();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: pageBody,
    );
  }
}
