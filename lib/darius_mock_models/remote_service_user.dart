import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Views/Classes/User.dart'; // Make sure to import the correct path to your ActivityDetails class

class RemoteServiceUser {
  Future<List<User>?> getUser() async {
    var client = http.Client();

    var url = Uri.parse('https://8999a859-c8c7-432a-96a8-cd4f196275da.mock.pstmn.io/user');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return activityFromJson(json); // Use the correct parsing function
    } else {
      throw Exception('Failed to load activities');
    }
  }
}
