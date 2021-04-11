import 'dart:convert';
import 'dart:async';

import 'package:books_app/src/business_logic/models/post.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";
  final String fbURL =
      "https://flutter-book-app-test-default-rtdb.firebaseio.com/";

  Future<List<Post>> fetchAppPosts() async {
    final response = await http.get(Uri.parse(postsURL));
    if (response.statusCode == 200) {
      return [
        for (var i in json.decode(response.body)) Post.fromJson(i),
      ];
    } else
      return null;
  }
}
