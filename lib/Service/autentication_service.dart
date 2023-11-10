import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Views/Classes/User.dart';

void registerUser(String name, String username, int age, String password, List<String> tags, List<String> interests, String about) async{
  final url = Uri.parse('http://192.168.1.213:8081/user');

  final response = await http.post(
    url,
    body: jsonEncode({
      'username': username,
      'name': name,
      'age': age,
      'password': password,
      'tags': tags,
      'interests': interests,
      'about': 'this is the about',
    })
  );

  if (response.statusCode == 200) {
    print("User signed up");
  }
  else{
    print('message');
  }
}

Future<User?> logInUser(String username, String password) async {
  final url = Uri.parse('http://192.168.1.213:8081/login');

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    final dynamic responseData = json.decode(response.body);

    if (responseData is Map<String, dynamic> &&
        responseData.containsKey('user')) {
      final user = User.fromJson(responseData['user']);
      print(user.username);
      return user;
    } else {
      final message = responseData.toString(); // Convert it to a string
      print(message);
      return null; // Return null to indicate the login was not successful.
    }
  } else {
    print('Login failed with status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    return null; // Return null to indicate the login was not successful.
  }
}

