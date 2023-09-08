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
