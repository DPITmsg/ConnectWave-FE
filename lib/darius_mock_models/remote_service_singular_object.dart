import 'dart:convert';
import 'package:http/http.dart' as http;


Future<Map<String, dynamic>> fetchData2(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Failed to load data. Status code: ${response.statusCode}');
  }
}

Future<Map<String, dynamic>> fetchUserData() async {
  final url = 'https://8999a859-c8c7-432a-96a8-cd4f196275da.mock.pstmn.io/user';
  return fetchData2(url);
}