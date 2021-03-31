import 'package:books_app/src/business_logic/models/book.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookItem extends StatelessWidget {
  Book itemDataObject;

  BookItem({this.itemDataObject});

  _launchURL(String url) async {
    String def_url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      await launch(def_url);
      //throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        IconButton(
          onPressed: () => Navigator.pop(context, true),
          icon: Icon(Icons.close),
          tooltip: 'close book item popup',
        ),
      ],
      title: Column(
        children: [
          Text(itemDataObject.title),
          Text(itemDataObject.country),
          Text(itemDataObject.language),
          InkWell(
              child: new Text(itemDataObject.link),
              onTap: () {
                _launchURL(itemDataObject.link);
              }),
        ],
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
