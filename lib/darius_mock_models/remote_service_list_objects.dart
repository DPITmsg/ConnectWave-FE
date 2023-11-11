import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Views/Classes/activitydetails.dart';

Future<List<Map<String, dynamic>>> fetchData(String url) async {
  final response = await http.get(Uri.parse(url));


  if (response.statusCode == 200) {
    final dynamic data = json.decode(response.body);

    if (data is List) {
      return data.cast<Map<String, dynamic>>();
    } else {
      throw FormatException("Invalid data format: Expected a List.");
    }
  } else {
    throw Exception('Failed to load data. Status code: ${response.statusCode}');
  }
}


Future<List<Map<String, dynamic>>> fetchEventHistoryData() async{
  final url = 'https://149ec1f0-e710-405f-ac6e-bc74fdf394a0.mock.pstmn.io/activityhistory';
  return fetchData(url);
}

Future<List<Map<String, dynamic>>> fetchEventData() async {
  final url = 'http://192.168.1.213:8081/activities';
  return fetchData(url);
}

Future<List<Map<String, dynamic>>> fetchAddressData() async {
  final url = 'https://524667bc-2cfa-480b-9efa-69e31518f3e3.mock.pstmn.io/activity';
  return fetchData(url);
}

Future<List<ActivityDetails>> fetchEnrolledActivitesData(List<int> ids) async {
  final url = Uri.parse('http://192.168.1.213:8081/activity_by_id');
  List<ActivityDetails> list_activities = [];

  for (var i = 0; i < ids.length; i++) {

    String id = ids[i].toString();
    print(id);

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'id': id})
    );

    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> activityDetails = json.decode(response.body);
        ActivityDetails activity = ActivityDetails.fromJson(activityDetails);
        list_activities.add(activity);
      } catch (e) {
        print("Error decoding JSON: $e");
      }
    } else {
      print("Request failed with status code: ${response.statusCode}");
    }
  }

  return list_activities;
}





