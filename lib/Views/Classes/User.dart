import 'dart:convert';
import 'activitydetails.dart';


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


  return User.fromJson({
    ...jsonData,
    'interests': interests,
    'tags': tags,
    'friends_list': friendsList,
    'activities_created': activities_created,
    'activities_enrolled': activities_enrolled
  });
}


String postToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  String _name = '';
  String _username = '';
  double _rating = 0;
  int _activicompleted = 0;
  int _friends = 0;
  String _favcategory = '';
  String _about = '';
  List<String> _interests = [];
  List<String> _tags = [];
  List<String> _friends_list = [];
  int _age = 0;
  List<ActivityDetails> _activities_created = [];
  List<ActivityDetails> _activities_enrolled = [];

  User(
      {required name,
        required username,
        required rating,
        required activicompleted,
        required friends,
        required favcategory,
        required about,
        required interests,
        required tags,
        required friends_list,
        required age,
        required activities_created,
        required activities_enrolled})
      : _name = name,
        _username = username,
        _rating = rating,
        _activicompleted = activicompleted,
        _friends = friends,
        _favcategory = favcategory,
        _about = about,
        _interests = interests,
        _tags = tags,
        _friends_list = friends_list,
        _age = age,
        _activities_created = activities_created,
        _activities_enrolled = activities_enrolled;

  factory User.fromJson(Map<String, dynamic> json) =>
      User(
        name: json["name"],
        username: json["username"],
        rating: json["rating"],
        activicompleted: json["activicompleted"],
        friends: json["friends"],
        favcategory: json["favcategory"],
        about: json["about"],
        interests: List<String>.from(json["interests"]),
        tags: List<String>.from(json["tags"]),
        friends_list: List<String>.from(json["friends_list"]),
        age: json["age"],
        activities_created: (json["activities_created"] as List<dynamic>)
            .map((activity) => ActivityDetails.fromJson(activity))
            .toList(),
        activities_enrolled: (json["activities_enrolled"] as List<dynamic>)
            .map((activity) => ActivityDetails.fromJson(activity))
            .toList(),
      );

  Map<String, dynamic> toJson() =>
      {
        "name": name,
        "username": username,
        "rating": rating,
        "activicompleted": activicompleted,
        "friends": friends,
        "favcategory": favcategory,
        "about": about,
        "interests": interests,
        "tags": tags,
        "friends_list": friends_list,
        "age": age,
        "activities_created": activities_created,
        "activities_enrolled": activities_enrolled,
      };

  List<ActivityDetails> get activities_created => _activities_created;

  set activities_created(List<ActivityDetails> value) {
    _activities_created = value;
  }

  String get username => _username;

  set username(String value) {
    _username = value;
  }

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  List<String> get friends_list => _friends_list;

  set friends_list(List<String> value) {
    _friends_list = value;
  }

  String get name => _name;

  List<String> get tags => _tags;

  List<String> get interests => _interests;

  String get about => _about;

  String get favcategory => _favcategory;

  int get friends => _friends;

  int get activicompleted => _activicompleted;

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

  set favcategory(String value) {
    _favcategory = value;
  }

  set friends(int value) {
    _friends = value;
  }

  set activicompleted(int value) {
    _activicompleted = value;
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
