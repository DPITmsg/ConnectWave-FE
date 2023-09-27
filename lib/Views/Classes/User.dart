import 'dart:convert';
import 'Friend.dart';
import 'activitydetails.dart';
import 'ActivityHistory.dart';


User userFromJson(Map<String, dynamic> jsonData) {
  List<String> interests = List<String>.from(jsonData['interests']);
  List<String> tags = List<String>.from(jsonData['tags']);
  List<String> friendsList = List<String>.from(jsonData['friends_list']);

  List<ActivityDetails> activities_created = (jsonData['activities_created'] != null)
      ? activityFromJson(jsonData['activities_created'])
      : [];

  List<ActivityDetails> activities_enrolled = (jsonData['activities_enrolled'] != null)
      ? activityFromJson(jsonData['activities_enrolled'])
      : [];

  List<ActivityHistory> activities_completed = (jsonData['activities_enrolled'] != null)
      ? activityHistoryFromJson(jsonData['activities_enrolled'])
      : [];

  List<Friend> friends_list = (jsonData['friends'] != null)
      ? friendFromJson(jsonData['friends'])
      : [];


  return User.fromJson({
    ...jsonData,
    'interests': interests,
    'tags': tags,
    'friends_list': friendsList,
    'activities_created': activities_created,
    'activities_enrolled': activities_enrolled,
    'activities_completed': activities_completed,
    'friends_list': friends_list
  });
}


String postToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  String _name = '';
  String _username = '';
  double _rating = 0;
  String _about = '';
  List<String> _interests = [];
  List<String> _tags = [];
  int _age = 0;
  String _pfp = '';
  List<ActivityDetails> _activities_created = [];
  List<ActivityDetails> _activities_enrolled = [];
  List<ActivityHistory> _activities_completed = [];
  List<Friend> _friends = [];

  User(
      {required name,
        required username,
        required rating,
        required about,
        required interests,
        required tags,
        required age,
        required activities_created,
        required activities_enrolled,
        required activities_completed,
        required friends,
        required pfp})
      : _name = name,
        _username = username,
        _rating = rating,
        _about = about,
        _interests = interests,
        _tags = tags,
        _age = age,
        _activities_created = activities_created,
        _activities_enrolled = activities_enrolled,
        _activities_completed = activities_completed,
        _friends = friends,
        _pfp = pfp;

  factory User.fromJson(Map<String, dynamic> json) =>
      User(
        name: json["name"],
        username: json["username"],
        rating: json["rating"],
        about: json["about"],
        interests: List<String>.from(json["interests"]),
        tags: List<String>.from(json["tags"]),
        age: json["age"],
        pfp: json["pfp"],
        activities_created: (json["activities_created"] as List<dynamic>)
            .map((activity) => ActivityDetails.fromJson(activity))
            .toList(),
        activities_enrolled: (json["activities_enrolled"] as List<dynamic>)
            .map((activity) => ActivityDetails.fromJson(activity))
            .toList(),
        activities_completed: (json["activities_completed"] as List<dynamic>)
          .map((activity) => ActivityHistory.fromJson(activity))
          .toList(),
        friends: (json["friends"] as List<dynamic>)
          .map((friend) => Friend.fromJson(friend))
          .toList()
      );

  Map<String, dynamic> toJson() =>
      {
        "name": name,
        "username": username,
        "rating": rating,
        "about": about,
        "interests": interests,
        "tags": tags,
        "age": age,
        "pfp": pfp,
        "activities_created": activities_created,
        "activities_enrolled": activities_enrolled,
        "activities_completed": activities_completed,
        "friends": friends
      };

  String get pfp => _pfp;

  set pfp(String value) {
    _pfp = value;
  }

  List<ActivityDetails> get activities_created => _activities_created;

  set activities_created(List<ActivityDetails> value) {
    _activities_created = value;
  }

  String get username => _username;

  List<Friend> get friends => _friends;

  set friends(List<Friend> value) {
    _friends = value;
  }

  set username(String value) {
    _username = value;
  }

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  List<ActivityHistory> get activities_completed => _activities_completed;

  set activities_completed(List<ActivityHistory> value) {
    _activities_completed = value;
  }

  String get name => _name;

  List<String> get tags => _tags;

  List<String> get interests => _interests;

  String get about => _about;

  double get rating => _rating;

  set tags(List<String> value) {
    _tags = value;
  }

  set interests(List<String> value) {
    _interests = value;
  }

  set about(String value) {
    _about = value;
  }


  set rating(double value) {
    _rating = value;
  }

  set name(String value) {
    _name = value;
  }

  List<ActivityDetails> get activities_enrolled => _activities_enrolled;

  set activities_enrolled(List<ActivityDetails> value) {
    _activities_enrolled = value;
  }
}
