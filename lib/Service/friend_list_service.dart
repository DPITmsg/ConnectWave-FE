import 'dart:convert';

import 'package:http/http.dart' as http;

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
    Uri.parse('https://0421adcb-e569-4ea1-90bc-1321371ea2f4.mock.pstmn.io/user_list?username=$username'),
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
