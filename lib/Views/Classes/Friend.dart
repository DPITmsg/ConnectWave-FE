import 'dart:convert';

List<Friend> friendFromJson(String str){
  List<dynamic> jsonData = json.decode(str);

  return jsonData.map((json) => Friend.fromJson(json)).toList();
}

class Friend {
  String _name = '';
  String _pfp = '';

  Friend({required name, required pfp})
      : _name = name,
        _pfp = pfp;

  factory Friend.fromJson(Map<String, dynamic> json) =>
      Friend(
        name: json["name"],
        pfp: json['pfp'],
      );

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get pfp => _pfp;

  set pfp(String value) {
    _pfp = value;
  }
}