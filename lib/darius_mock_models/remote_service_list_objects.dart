import 'dart:convert';

import 'package:http/http.dart' as http;

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
  final url = 'https://bf8c4f5a-d8ae-43f1-8d35-3ad3765101b6.mock.pstmn.io/activity';
  return fetchData(url);
}

Future<List<Map<String, dynamic>>> fetchAddressData() async {
  final url = 'https://524667bc-2cfa-480b-9efa-69e31518f3e3.mock.pstmn.io/activity';
  return fetchData(url);
}





