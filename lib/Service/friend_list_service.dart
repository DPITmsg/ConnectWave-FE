import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response> getFriendList() {
  return http.get(
      Uri.parse('https://0421adcb-e569-4ea1-90bc-1321371ea2f4.mock.pstmn.io/friends'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
  );
}

Future<http.Response> getUserList() {
  return http.get(
    Uri.parse('https://0421adcb-e569-4ea1-90bc-1321371ea2f4.mock.pstmn.io/user_list'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}

Future<http.Response> getRequestList() {
  return http.get(
    Uri.parse('https://0421adcb-e569-4ea1-90bc-1321371ea2f4.mock.pstmn.io/request'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}

Future<http.Response> responseFriendRequest(String name) {
  return http.post(
      Uri.parse('https://0421adcb-e569-4ea1-90bc-1321371ea2f4.mock.pstmn.io/accept_or_deny'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    body: jsonEncode(<String, String>{
      'name': name,
    }),
  );
}

Future<http.Response> sendFriendRquest(String name) {
  return http.post(
    Uri.parse('https://0421adcb-e569-4ea1-90bc-1321371ea2f4.mock.pstmn.io/send_friend_request'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
    }),
  );
}
Future<http.Response> removeFriend(String name) {
  return http.post(
    Uri.parse('https://0421adcb-e569-4ea1-90bc-1321371ea2f4.mock.pstmn.io/remove_friend'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
    }),
  );
}
