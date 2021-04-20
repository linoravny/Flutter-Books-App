import 'package:books_app/src/business_logic/models/book.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookItem extends StatelessWidget {
  final Book itemDataObject;

  BookItem({this.itemDataObject});

  _launchURL(String url) async {
    String defUrl = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      await launch(
        defUrl,
        forceWebView: true,
      );
      //throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.deepOrange[50],
      padding: const EdgeInsets.all(25),
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(itemDataObject.title),
          Text(itemDataObject.country),
          Text(itemDataObject.language),
          InkWell(
              child: new Text(
                itemDataObject.link,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              onTap: () {
                _launchURL(itemDataObject.link);
              }),
        ],
      ),
    );
  }
}
