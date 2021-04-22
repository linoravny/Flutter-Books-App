import 'package:books_app/src/business_logic/models/book.dart';
import 'package:books_app/src/damy_data/books_data.dart';
import 'package:books_app/src/menu.dart';
import 'package:books_app/src/views/widgets/book_item.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:flutter/material.dart';

class BookList extends StatefulWidget {
  final String category;
  BookList(this.category);

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  String sortDirection = 'ascending';
  List<Book> filterBook = [];

  @override
  void initState() {
    print('book list initState()');
    filterBook = DUMMY_BOOKS.where((item) {
      return (widget.category == 'All')
          ? true
          : item.category == widget.category;
    }).toList();
    sortList();
    super.initState();
  }

  void sortList() {
    if (sortDirection == 'ascending')
      filterBook.sort((a, b) => a.author.compareTo(b.author));
    else
      filterBook.sort((b, a) => a.author.compareTo(b.author));
  }

  Widget buildCustomAppHeader(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        tooltip: 'back button',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text('books List'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.sort_by_alpha),
          tooltip: 'sort by title',
          onPressed: () {
            if (sortDirection == 'ascending')
              sortDirection = 'descending';
            else
              sortDirection = 'ascending';
            setState(() {
              sortList();
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Menu(),
      appBar: buildCustomAppHeader(context),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: filterBook.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(
                        Icons.book_online_outlined,
                      ),
                      title: Text(
                          'Book Title: ${filterBook[index].title}, Category: ${DUMMY_BOOKS[index].category}'),
                      subtitle: Text(filterBook[index].author),
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
                                  itemDataObject: filterBook[index],
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
