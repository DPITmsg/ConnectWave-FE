import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';

List<ActivityDetails> activityFromJson(String str) {
  List<dynamic> jsonData = json.decode(str);

  return jsonData.map((json) => ActivityDetails.fromJson(json)).toList();
}

// String postToJson(List<ActivityDetails> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class ActivityDetails {
  int _id = 0;
  String _date = '';
  String _endDate = '';
  String _time = '';
  String _author = '';
  String _title = '';
  List<String> _tags = [];
  String _category = '';
  String _address = '';
  String _description = '';
  LatLng _location = LatLng(0, 0);
  List<String> _participants = [];
  int _maxParticipants = 0;

  ActivityDetails({
    required id,
    required date,
    required endDate,
    required time,
    required author,
    required title,
    required tags,
    required category,
    required address,
    required description,
    required location,
    required participants,
    required maxParticipants,
  })
      :_id = id,
        _date = date,
        _endDate = endDate,
        _time = time,
        _author = author,
        _title = title,
        _tags = tags,
        _category = category,
        _address = address,
        _description = description,
        _location = location,
        _participants = participants,
        _maxParticipants = maxParticipants;

  factory ActivityDetails.fromJson(Map<String, dynamic> json) =>
      ActivityDetails(
        id: json["id"],
        date: json["date"],
        endDate: json["endDate"],
        time: json["time"],
        author: json["author"],
        title: json["title"],
        tags: List<String>.from(json["tags"]),
        category: json["category"],
        address: json["address"],
        description: json["description"],
        location: LatLng(
          json["location"]["latitude"].toDouble(),
          json["location"]["longitude"].toDouble(),
        ),
        participants: List<String>.from(json["participants"]),
        maxParticipants: json["maxParticipants"]
      );

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "date": date,
        "endDate": endDate,
        "time": time,
        "author": author,
        "title": title,
        "tags": tags,
        "category": category,
        "address": address,
        "description": description,
        "location": {
          "latitude": location.latitude,
          "longitude": location.longitude,
        },
        "participants": participants,
        "maxParticipants": maxParticipants
      };

  int get maxParticipants => _maxParticipants;

  set maxParticipants(int value) {
    _maxParticipants = value;
  }

  List<String> get participants => _participants;

  set participants(List<String> value) {
    _participants = value;
  }

  String get endDate => _endDate;

  set endDate(String value) {
    _endDate = value;
  }

  String get author => _author;

  set author(String value) {
    _author = value;
  }

  LatLng get location => _location;

  set location(LatLng value) {
    _location = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get category => _category;

  set category(String value) {
    _category = value;
  }

  List<String> get tags => _tags;

  set tags(List<String> value) {
    _tags = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get time => _time;

  set time(String value) {
    _time = value;
  }
}