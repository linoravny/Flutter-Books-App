import 'package:books_app/src/damy_data/books_data.dart';
import 'package:books_app/src/main-shell.dart';
import 'package:books_app/src/views/pages/book_item.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageHeader = AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        tooltip: 'back button',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      title: Text('books List'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          tooltip: 'search by title',
          onPressed: () {},
        ),
      ],
    );

    final pageBody = Container(
      child: Center(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: DUMMY_BOOKS.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.book_online_outlined,
                        color: Colors.pink,
                      ),
                      title: Text(
                          'Book Title: ${DUMMY_BOOKS[index].title}, Category: ${DUMMY_BOOKS[index].category}'),
                      subtitle: Text(DUMMY_BOOKS[index].author),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('Book Details'),
                          onPressed: () {
                            showMaterialModalBottomSheet(
                              context: context,
                              builder: (context) => SingleChildScrollView(
                                controller: ModalScrollController.of(context),
                                child: BookItem(
                                  itemDataObject: DUMMY_BOOKS[index],
                                ),
                              ),
                            );
                            // showDialog<void>(
                            //   context: context,
                            //   barrierDismissible: false,
                            //   builder: (_) => BookItem(
                            //       itemDataObject: DUMMY_BOOKS[index]),
                            // );

                            // Navigator.of(context).push(
                            //   new MaterialPageRoute<Null>(
                            //       builder: (BuildContext context) {
                            //         return new BookItem();
                            //       },
                            //       fullscreenDialog: true),
                            // );
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],

                  //Text('Book Title: ${DUMMY_BOOKS[index].title}'),
                ),
              ),
            );
          },
        ),
      ),
    );

    return AppMainShell(
      widget: pageBody,
      customAppHeader: pageHeader,
    );
  }
}
