import 'package:flutter/material.dart';

class Book {
  final String author;
  final String country;
  final String imageLink;
  final String language;
  final String link;
  final double pages;
  final String title;
  final double year;
  final String category;

  const Book({
    @required this.author,
    @required this.country,
    this.imageLink,
    this.language,
    this.link,
    this.pages,
    this.title,
    this.year,
    this.category,
  });
}
