import 'dart:convert';
import 'package:http/http.dart' as http;

const String url2 = 'http://127.0.0.1:8081';

Future<Map<String, dynamic>> fetchData2(String url) async {
  print("1");
  final response = await http.get(Uri.parse(url));
  print("2");

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print("correct");
    return data;
  } else {
    throw Exception('Failed to load data. Status code: ${response.statusCode}');
  }
}

Future<Map<String, dynamic>> fetchUserData(String username) async {
  final url = 'https://2f63420a-f575-4684-83e3-fbc2331a11d8.mock.pstmn.io/user';

  return fetchData2(url);
}