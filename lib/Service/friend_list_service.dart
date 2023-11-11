import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Views/Classes/User.dart';

Future<http.Response> getFriendList(String username) {
  return http.get(
      Uri.parse('https://0421adcb-e569-4ea1-90bc-1321371ea2f4.mock.pstmn.io/friends?username=$username'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
  );
}

Future<http.Response> getUserList(String username) {
  return http.get(
    Uri.parse('http://192.168.1.213:8081/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}

Future<http.Response> getRequestList(String username) {
  return http.get(
    Uri.parse('https://0421adcb-e569-4ea1-90bc-1321371ea2f4.mock.pstmn.io/request?username=$username'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}

Future<http.Response> responseFriendRequest(String name, String response, String currentUsername) {
  return http.post(
      Uri.parse('https://0421adcb-e569-4ea1-90bc-1321371ea2f4.mock.pstmn.io/accept_or_deny'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    body: jsonEncode(<String, String>{
      'name': name,
      'response':response,
      'currentUsername':currentUsername,
    }),
  );
}

Future<http.Response> sendFriendRquest(String name, String currentUsername) {
  return http.post(
    Uri.parse('https://0421adcb-e569-4ea1-90bc-1321371ea2f4.mock.pstmn.io/send_friend_request'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'currentUsername':currentUsername,
    }),
  );
}
Future<http.Response> removeFriend(String name, String currentUser) {
  return http.post(
    Uri.parse('https://0421adcb-e569-4ea1-90bc-1321371ea2f4.mock.pstmn.io/remove_friend'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'currentUser':currentUser,
    }),
  );
}

Future<User?> getUserByUsername(String username) async{
  final url = Uri.parse('http://192.168.1.213:8081/get_user_by_username');

  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({'username' : username}),
  );

  if (response.statusCode == 200){
    final data = json.decode(response.body);

    User? user = userFromJson(data);

    return user;
  }
  return null;
}

Future<void> updateUser(String username, String new_name, String new_age, String new_about, List<String> new_tags, List<String> new_interests)async {
  final url = Uri.parse('http://192.168.1.213:8081/edit_user');

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode({
      'username': username,
      'name': new_name,
      'age': new_age,
      'about': new_about,
      'tags': new_tags,
      'interests': new_interests,
      'rating': 0.0,
    })
  );

  if (response.statusCode == 200){
    print("Worked");
  }
  else{
    print("Didn't work");
  }
}
