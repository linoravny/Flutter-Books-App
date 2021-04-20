import 'package:books_app/src/views/pages/book_list.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem(this.title, this.color);

  void selectCategories(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return BookList(title);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategories(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(title),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.8), color],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
