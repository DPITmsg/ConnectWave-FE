import 'post.dart';
import 'package:http/http.dart' as http;
import 'package:my_project/Views/activityhistory.dart';

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var url = Uri.parse('https://e6c57aac-176c-426a-97af-1ba80c7c39ad.mock.pstmn.io/activity');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json); // Return the parsed list of posts
    } else {
      throw Exception('Failed to load posts');
    }
  }
}