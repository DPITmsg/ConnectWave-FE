import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_project/Views/Classes/activitydetails.dart';

Future<http.Response> createActivty(ActivityDetails activity) {
  return http.post(
    Uri.parse('http://192.168.1.213:8081/activity'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(activity.toJson())
  );
}

Future<http.Response> getTrendingList() {
  return http.get(
    Uri.parse('https://0421adcb-e569-4ea1-90bc-1321371ea2f4.mock.pstmn.io/trending'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}

Future<http.Response> getForYouList() {
  return http.get(
    Uri.parse('https://0421adcb-e569-4ea1-90bc-1321371ea2f4.mock.pstmn.io/foryou'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}

Future<http.Response> joinActivity(int id,String username) {
  return http.post(
    Uri.parse('http://192.168.1.213:8081/join'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id':id.toString(),
      'username': username,
    }),
  );
}

Future<http.Response> postIdGetActivity(int id) {
  return http.post(
    Uri.parse('https://0421adcb-e569-4ea1-90bc-1321371ea2f4.mock.pstmn.io/get_activity_details'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id':id.toString(),
    }),
  );
}

Future<http.Response> unJoinActivity(int id,String username) {
  return http.post(
    Uri.parse('http://192.168.1.213:8081/quit'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id':id.toString(),
      'username': username,
    }),
  );
}

Future<ActivityDetails?> getActivityById(int id) async{
  final url = Uri.parse('http://192.168.1.213:8081/activity_by_id');

  final response = await http.post(
      url,
    headers: {
        'Content-Type' : 'application/json; charset=UTF-8',
    },
    body: jsonEncode({'id': id.toString()}),
  );

  if (response.statusCode == 200){
    Map<String, dynamic> data = json.decode(response.body);

    ActivityDetails? activity = ActivityDetails.fromJson(data);

    return activity;
  }
  else{
    return null;
  }
}

