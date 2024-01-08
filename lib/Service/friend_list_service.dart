import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Views/Classes/User.dart';

Future<List<String>?> getFriendList(String username) async {
  final response = await http.post(
    Uri.parse('http://192.168.1.213:8081/friends_by_username'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({'username': username}),
  );

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);

    List<String> usernamesFriends = [];

    data.forEach((friend) {
      String otherUsername = (friend['username1'] == username)
          ? friend['username2']
          : friend['username1'];

      usernamesFriends.add(otherUsername);
    });

    print(usernamesFriends);
    return usernamesFriends;
  } else {
    print('did not work');
    return null;
  }
}


Future<http.Response> getUserList(String username) {
  return http.get(
    Uri.parse('http://192.168.1.213:8081/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}

Future<List<String>?> getRequestList(String username) async {
  final response = await http.post(
    Uri.parse('http://192.168.1.213:8081/friend_requests_by_username'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({'username': username}),
  );
  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);

    List<String> usernamesFriends = [];

    data.forEach((friend) {
      usernamesFriends.add(friend['username2']);
    });

    return usernamesFriends;
  } else {
    print('did not work');
    return null;
  }
}

Future<void> acceptFriendRequest(String username_user, String username_friend) async{
  final response = await http.post(
    Uri.parse('http://192.168.1.213:8081/accept_friend_request'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username_user': username_user,
      'username_friend': username_friend,
    }),
  );

  if (response.statusCode == 200){
    print('worked');
  }
  else{
    print("didn't work");
  }
}


Future<void> declineFriendRequest(String name, String currentUser) async{
  final response = await http.post(
    Uri.parse('http://192.168.1.213:8081/decline_friend_request'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username_user': name,
      'username_friend':currentUser,
    }),
  );
  if (response.statusCode == 200){
    print('worked');
  }
  else{
    print("didn't work");
  }
}

Future<void> sendFriendRquest(String name, String currentUsername) async {
  final response = await http.post(
    Uri.parse('http://192.168.1.213:8081/send_friend_request'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username_user': name,
      'username_friend': currentUsername,
    }),
  );

  if (response.statusCode == 200){
    print('worked');
  }
  else{
    print("didn't work");
  }
}
Future<void> removeFriend(String name, String currentUser) async{
  final response = await http.post(
    Uri.parse('http://192.168.1.213:8081/decline_friend_request'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username_user': name,
      'username_friend':currentUser,
    }),
  );
  if (response.statusCode == 200){
    print('worked');
  }
  else{
    print("didn't work");
  }
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

    print(data['activities_created']);

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
