import 'dart:io';

import 'package:books_app/src/business_logic/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class MainHeader extends StatefulWidget implements PreferredSizeWidget {
  final title;
  MainHeader({this.title});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  _MainHeaderState createState() => _MainHeaderState();
}

class _MainHeaderState extends State<MainHeader> {
  PickedFile imageFile;
  Future<PickedFile> _getImage(int type) async {
    PickedFile pickedImage = await ImagePicker().getImage(
        source: type == 1 ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 50);
    return pickedImage;
  }

  @override
  Widget build(BuildContext context) {
    //listener to provider
    final userData = Provider.of<UserData>(
      context,
    ).userData;
    final isUserAuth = (userData != null) ? userData.isAuth : false;
    print('isUserAuth=' + isUserAuth.toString());

    return AppBar(
      leading: (isUserAuth)
          ? IconButton(
              icon: Icon(Icons.camera_alt_sharp),
              tooltip: 'Open Device Camera',
              onPressed: () async {
                final tmpFile = await _getImage(2);

                setState(() {
                  imageFile = tmpFile;
                });
              },
            )
          : CircleAvatar(
              backgroundColor: Color(0xdb7093),
              backgroundImage:
                  new AssetImage('assets/images/small-person-icon-24.jpg'),
            ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isUserAuth)
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
    );
  }
}
