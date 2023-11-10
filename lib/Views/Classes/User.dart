import 'dart:convert';

import 'Friend.dart';


User userFromJson(Map<String, dynamic> jsonData) {
  List<String> interests = (jsonData['interests'] != null) ? List<String>.from(jsonData['interests']) : [];
  List<String> tags = (jsonData['tags'] != null) ? List<String>.from(jsonData['tags']) : [];
  List<int> activities_created = (jsonData['activities_created'] != null) ? List<int>.from(jsonData['activities_created']) : [];
  List<int> activities_enrolled = (jsonData['activities_enrolled'] != null) ? List<int>.from(jsonData['activities_enrolled']) : [];
  List<int> activities_completed = (jsonData['activities_completed'] != null) ? List<int>.from(jsonData['activities_completed']) : [];

  return User.fromJson({
    ...jsonData,
    'interests': interests,
    'tags': tags,
    'activities_created': activities_created,
    'activities_enrolled': activities_enrolled,
    'activities_completed': activities_completed,
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
  List<int> _activities_created = [];
  List<int> _activities_enrolled = [];
  List<int> _activities_completed = [];
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"] ?? '',
      username: json["username"] ?? '',
      rating: json["rating"] != null ? json["rating"].toDouble() : 0.0,
      about: json["about"] ?? '',
      interests: ['sugi pula'],
      tags: ['de bou'],
      age: json["age"] ?? 0,
      pfp: json["pfp"] ?? '',
      activities_created: [0],
      activities_enrolled: [0],
      activities_completed: [0],
      friends: [Friend(name: 'taci', pfp: '')],
    );
  }


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

  List<int> get activities_created => _activities_created;

  set activities_created(List<int> value) {
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

  List<int> get activities_completed => _activities_completed;

  set activities_completed(List<int> value) {
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

  List<int> get activities_enrolled => _activities_enrolled;

  set activities_enrolled(List<int> value) {
    _activities_enrolled = value;
  }
}
