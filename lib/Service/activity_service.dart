import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_project/Views/Classes/activitydetails.dart';

Future<http.Response> createActivty(ActivityDetails activity) {
  return http.post(
    Uri.parse('https://0421adcb-e569-4ea1-90bc-1321371ea2f4.mock.pstmn.io/activity'),
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
    Uri.parse('https://0421adcb-e569-4ea1-90bc-1321371ea2f4.mock.pstmn.io/join_activity'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id':id.toString(),
      'username': username,
    }),
  );
}