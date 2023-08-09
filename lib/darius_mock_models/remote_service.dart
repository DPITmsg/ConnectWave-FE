import 'post.dart';
import 'package:http/http.dart' as http;
import 'package:my_project/activityhistory/Widgets/activityhistory.dart';

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json); // Return the parsed list of posts
    } else {
      throw Exception('Failed to load posts');
    }
  }
}