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
  final url = 'https://2523-2a02-2f0e-d-4b00-1473-dc26-7a60-5be3.ngrok-free.app/activities';
  return fetchData(url);
}

Future<List<Map<String, dynamic>>> fetchAddressData() async {
  final url = 'https://524667bc-2cfa-480b-9efa-69e31518f3e3.mock.pstmn.io/activity';
  return fetchData(url);
}

Future<List<ActivityDetails>> fetchEnrolledActivitesData(List<int> ids) async{
  final url = Uri.parse('http://192.168.1.213:8081/activities/activity_by_id');
  List<ActivityDetails> list_activities = [];

  for (var i = 0; i < ids.length; i++){
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: {
        "id": ids[i].toString(),
      }
    );
    ActivityDetails activity = json.decode(response.body);
    
    list_activities.add(activity);
  }

  return list_activities;
}





