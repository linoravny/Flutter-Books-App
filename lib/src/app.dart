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

  PickedFile imageFile;
  Future _getImage(int type) async {
    PickedFile pickedImage = await ImagePicker().getImage(
        source: type == 1 ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 50);
    return pickedImage;
  }

  // File _image;
  // _imgFromCamera() async {
  //   File image = await ImagePicker().pickImage(
  //       source: ImageSource.camera, imageQuality: 50);

  //   setState(() {
  //     _image = image;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return //Platform.isIOS
        // ? CupertinoPageScaffold(
        //     navigationBar: CupertinoNavigationBar(
        //       backgroundColor: CupertinoColors.systemGrey.withOpacity(0.8),
        //       middle: const Text('Books App'),
        //     ),
        //     child: Column(
        //       children: <Widget>[pageBody],
        //     ),
        //   )
        //:
        Scaffold(
      appBar: AppBar(
        title: const Text('Books App'),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(9.0),
          child: Container(
            color: Color(0xdb7093),
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundColor: Color(0xdb7093),
              backgroundImage: imageFile == null
                  ? new AssetImage('assets/images/small-person-icon-24.jpg')
                  : FileImage(File(imageFile.path)),
            ),
          ),
        ),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.login, size: 18),
            label: Text("Login"),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () async {},
          ),
          IconButton(
              icon: Icon(Icons.camera_alt_sharp),
              tooltip: 'Open Device Camera',
              onPressed: () async {
                final tmpFile = await _getImage(2);

                setState(() {
                  imageFile = tmpFile;
                });
              }),
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Menu',
            onPressed: () async {},
          ),
        ],
      ),
      body: pageBody,
    );
  }
}
