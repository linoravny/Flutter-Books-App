import 'package:flutter/material.dart';

import '../../damy_data/category_data.dart';
import '../utils/category_item.dart';

class BookCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
