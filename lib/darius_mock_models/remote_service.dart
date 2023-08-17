import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Views/Classes/activitydetails.dart';

Future<Map<String, dynamic>> fetchData(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Failed to load data. Status code: ${response.statusCode}');
  }
}

Future<Map<String, dynamic>> fetchEventData() async {
  final url = 'https://e6c57aac-176c-426a-97af-1ba80c7c39ad.mock.pstmn.io/activity';
  return fetchData(url);
}

Future<Map<String, dynamic>> fetchUserData() async {
  final url = 'https://8999a859-c8c7-432a-96a8-cd4f196275da.mock.pstmn.io/user';
  return fetchData(url);
}

Future<Map<String, dynamic>> fetchAddressData() async {
  final url = 'https://524667bc-2cfa-480b-9efa-69e31518f3e3.mock.pstmn.io/activity';
  return fetchData(url);
}

Future<Map<String, dynamic>> fetchTrendingData() async {
  final url = 'https://712408e2-acb4-4389-b34f-d41aaeca4a15.mock.pstmn.io/trending';
  return fetchData(url);
}



