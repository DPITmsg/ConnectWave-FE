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
  int _nrParticipants = 0;
  String _category = '';
  String _address = '';
  String _description = '';
  LatLng _location = LatLng(0, 0);

  ActivityDetails({
    required id,
    required date,
    required endDate,
    required time,
    required author,
    required title,
    required tags,
    required nrParticipants,
    required category,
    required address,
    required description,
    required location
  })
      :_id = id,
        _date = date,
        _endDate = endDate,
        _time = time,
        _author = author,
        _title = title,
        _tags = tags,
        _nrParticipants = nrParticipants,
        _category = category,
        _address = address,
        _description = description,
        _location = location;

  factory ActivityDetails.fromJson(Map<String, dynamic> json) =>
      ActivityDetails(
        id: json["id"],
        date: json["date"],
        endDate: json["endDate"],
        time: json["time"],
        author: json["author"],
        title: json["title"],
        tags: List<String>.from(json["tags"]),
        nrParticipants: json["nrParticipants"],
        category: json["category"],
        address: json["address"],
        description: json["description"],
        location: LatLng(
          json["location"]["latitude"].toDouble(),
          json["location"]["longitude"].toDouble(),
        ),
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
        "nrParticipants": nrParticipants,
        "category": category,
        "address": address,
        "description": description,
        "location": {
          "latitude": location.latitude,
          "longitude": location.longitude,
        },
      };

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

  int get nrParticipants => _nrParticipants;

  set nrParticipants(int value) {
    _nrParticipants = value;
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