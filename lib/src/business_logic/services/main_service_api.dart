import 'package:http/http.dart' as http;

class HttpService {
  final String postsURL = "https://jsonplaceholder.typicode.com";

  Future<http.Response> fetchAppPosts() {
    return http.get(Uri.https(postsURL, 'posts'));
  }
}
