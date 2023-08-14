import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Views/Classes/activitydetails.dart'; // Make sure to import the correct path to your ActivityDetails class

class RemoteService {
  Future<List<ActivityDetails>?> getActivities() async {
    var client = http.Client();

    var url = Uri.parse('https://e6c57aac-176c-426a-97af-1ba80c7c39ad.mock.pstmn.io/activity');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return activityFromJson(json); // Use the correct parsing function
    } else {
      throw Exception('Failed to load activities');
    }
  }
}


