import 'dart:convert';
import 'dart:async';

import 'package:books_app/src/business_logic/models/post.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  final String fbURL =
      "https://flutter-book-app-test-default-rtdb.firebaseio.com/";

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse(postsURL));

      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body) as List<dynamic>;

        final List<Post> listToReturn = [];
        extractedData.forEach((post) {
          listToReturn.add(Post.fromJson(post));
        });

        return Future<List<Post>>.value(listToReturn);
      } else {
        print('______fetchPosts() Failed to load data');
        throw Exception('Failed to load data!');
      }
    } catch (error) {
      print('______fetchPosts() error: ');
      throw error;
    }
  }
}
