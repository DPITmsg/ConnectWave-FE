import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Views/Classes/Activity.dart';

Future<http.Response> createActivty(Activity activity) {
  return http.post(
    Uri.parse('https://0421adcb-e569-4ea1-90bc-1321371ea2f4.mock.pstmn.io/activity'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(activity.toJson())
  );
}
