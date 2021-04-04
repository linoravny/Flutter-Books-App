import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import './menu.dart';
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
  Future<PickedFile> _getImage(int type) async {
    PickedFile pickedImage = await ImagePicker().getImage(
        source: type == 1 ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 50);
    return pickedImage;
  }

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
      endDrawer: Menu(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.camera_alt_sharp),
          tooltip: 'Open Device Camera',
          onPressed: () async {
            final tmpFile = await _getImage(2);

            setState(() {
              imageFile = tmpFile;
            });
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Color(0xdb7093),
              padding: EdgeInsets.all(8),
              child: CircleAvatar(
                backgroundColor: Color(0xdb7093),
                backgroundImage: imageFile == null
                    ? new AssetImage('assets/images/small-person-icon-24.jpg')
                    : FileImage(File(imageFile.path)),
              ),
            ),
            Text('Books App'),
          ],
        ),

        // actions: <Widget>[
        // ],
      ),
      body: pageBody,
    );
  }
}
