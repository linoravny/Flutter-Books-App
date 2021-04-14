import 'package:books_app/src/business_logic/models/post.dart';
import 'package:books_app/src/business_logic/services/main_service_api.dart';

import 'package:flutter/material.dart';
import 'dart:async';

class PostsProvider with ChangeNotifier {
  //with is mixin.
  HttpService apiService = new HttpService();

  List<Post> _posts = [];

  // double _counter = 1;
  // double get counter => _counter;
  // void setCounter(double newValue) {
  //   if (newValue != _counter) {
  //     _counter = newValue;
  //     notifyListeners();
  //   }
  // }

  List<Post> get getPosts {
    print('_____PostsProvider getPosts()');
    return _posts;
  }

  Future<void> addNewPost(post) async {
    _posts.add(post);
    notifyListeners();
    //return Future<void>.value();
  }

  Future<void> fetchAndsetPosts() async {
    print('_____PostsProvider fetchAndsetPosts()');
    if (_posts.length > 0) {
      return _posts;
    } else {
      return apiService.fetchPosts().then((response) {
        _posts = response;
        notifyListeners();
      });
    }
  }
}
