import 'package:books_app/src/business_logic/models/post.dart';
import 'package:books_app/src/business_logic/services/main_service_api.dart';

import 'package:flutter/material.dart';
import 'dart:async';

class PostsProvider with ChangeNotifier {
  //with is mixin.
  HttpService apiService = new HttpService();

  List<Post> _posts = [];
  List<Post> _userAddedPosts = [];

  List<Post> get getPosts {
    print('_____PostsProvider getPosts()');
    List<Post> newList = [..._posts, ..._userAddedPosts];
    Comparator<Post> titleComparator = (a, b) => a.title.compareTo(b.title);
    newList.sort(titleComparator);

    return newList;
  }

  List<Post> get getUserAddedPosts {
    print('_____PostsProvider getUserAddedPosts()');
    return _userAddedPosts;
  }

  Future<void> deleteUserAddedPost(postToRemove) async {
    print('_____PostsProvider deleteUserAddedPost()');
    _userAddedPosts.removeWhere((item) => item.appId == postToRemove.appId);
    notifyListeners();
  }

  Future<void> addNewPost(post) async {
    if (_userAddedPosts.length < 5) {
      _userAddedPosts.add(post);
      notifyListeners();
    }
  }

  Future<void> fetchAndsetPosts() async {
    print('_____PostsProvider fetchAndsetPosts()');
    // if (_posts.length > 0) {
    //   return _posts;
    // } else {
    return apiService.fetchPosts().then((response) {
      _posts = response;
      notifyListeners();
    });
    // }
  }
}
