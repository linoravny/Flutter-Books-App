import 'package:flutter/material.dart';

import '../../damy_data/books_data.dart';
import './book_item.dart';

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('books List'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'search by title',
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
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
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (_) => BookItem(
                                      itemDataObject: DUMMY_BOOKS[index]),
                                );
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
        ));
  }
}
