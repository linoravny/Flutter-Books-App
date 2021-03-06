import 'package:books_app/src/damy_data/category_data.dart';
import 'package:books_app/src/main_header.dart';
import 'package:books_app/src/menu.dart';
import 'package:books_app/src/views/widgets/category_item.dart';

import 'package:flutter/material.dart';

class BookCategories extends StatelessWidget {
  static const routeName = '/bookCategories';

  final pageBody = Column(
    children: [
      Center(
          heightFactor: 3,
          child: Text('Choose book category for display books list:')),
      Container(
        child: GridView.builder(
          padding: const EdgeInsets.all(20),
          controller: new ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: DUMMY_CATEGORIES.length,
          itemBuilder: (BuildContext context, int index) {
            return CategoryItem(
              DUMMY_CATEGORIES[index].title,
              DUMMY_CATEGORIES[index].color,
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Menu(),
      appBar: MainHeader(
        title: 'Books Categories',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: pageBody,
        ),
      ),
    );
  }
}
