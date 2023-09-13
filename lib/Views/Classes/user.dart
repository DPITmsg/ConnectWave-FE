import 'dart:convert';


User userFromJson(Map<String, dynamic> jsonData) {
  List<String> interests = List<String>.from(jsonData['interests']);
  List<String> tags = List<String>.from(jsonData['tags']);
  List<String> friendsList = List<String>.from(jsonData['friends_list']);

  return User.fromJson({
    ...jsonData,
    'interests': interests,
    'tags': tags,
    'friends_list': friendsList,
  });
}


String postToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  String _name = '';
  double _rating = 0;
  int _activicompleted = 0;
  int _friends = 0;
  String _favcategory = '';
  String _about = '';
  List<String> _interests = [];
  List<String> _tags = [];
  List<String> _friends_list = [];

  User(
      {required name,
        required rating,
        required activicompleted,
        required friends,
        required favcategory,
        required about,
        required interests,
        required tags,
        required friends_list})
      : _name = name,
        _rating = rating,
        _activicompleted = activicompleted,
        _friends = friends,
        _favcategory = favcategory,
        _about = about,
        _interests = interests,
        _tags = tags,
        _friends_list = friends_list;

  factory User.fromJson(Map<String, dynamic> json) =>
      User(
        name: json["name"],
        rating: json["rating"],
        activicompleted: json["activicompleted"],
        friends: json["friends"],
        favcategory: json["favcategory"],
        about: json["about"],
        interests: List<String>.from(json["interests"]),
        tags: List<String>.from(json["tags"]),
        friends_list: List<String>.from(json["friends_list"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "name": name,
        "rating": rating,
        "activicompleted": activicompleted,
        "friends": friends,
        "favcategory": favcategory,
        "about": about,
        "interests": interests,
        "tags": tags,
        "friends_list": friends_list
      };

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
}