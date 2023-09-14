import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Views/Classes/activitydetails.dart';

Future<List<Map<String, dynamic>>> fetchData(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    if (data is List) {
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception("Invalid data format: Expected a List.");
    }
  } else {
    throw Exception('Failed to load data. Status code: ${response.statusCode}');
  }
}


Future<List<Map<String, dynamic>>> fetchEventData() async {
  final url = 'https://e6c57aac-176c-426a-97af-1ba80c7c39ad.mock.pstmn.io/activity';
  return fetchData(url);
}

Future<List<Map<String, dynamic>>> fetchAddressData() async {
  final url = 'https://524667bc-2cfa-480b-9efa-69e31518f3e3.mock.pstmn.io/activity';
  return fetchData(url);
}




