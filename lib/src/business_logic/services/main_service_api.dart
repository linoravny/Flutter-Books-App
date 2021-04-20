import 'dart:convert';
import 'dart:async';

import 'package:books_app/src/business_logic/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class HttpService {
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  final String fbURL =
      "https://flutter-book-app-test-default-rtdb.firebaseio.com/";

  Future<List<Post>> fetchPosts() async {
    try {
      print('HttpService fetchPosts strat');
      final response = await http.get(Uri.parse(postsURL)).catchError((err) {
        print('HttpService fetchPosts erro');
        print(err);
      });
      print('HttpService fetchPosts response');
      var uuid = Uuid();

      if (response.statusCode == 200) {
        print('HttpService fetchPosts statusCode == 200');
        var extractedData = json.decode(response.body) as List<dynamic>;

        final List<Post> listToReturn = [];

        extractedData.forEach((post) {
          post["appId"] = uuid.v1();
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
