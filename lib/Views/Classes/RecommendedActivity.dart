import 'package:google_maps_flutter/google_maps_flutter.dart';

class RecommendedActivity {
  String _title = '';
  String _author = '';
  String _address = '';
  int _nr_participants = 0;
  int _id = 0;
  LatLng _location = LatLng(0, 0);

  RecommendedActivity(
      {required title,
      required author,
      required address,
      required nr_participants,
      required id,
      required location})
      : _title = title,
        _author = author,
        _address = address,
        _nr_participants = nr_participants,
        _id = id,
        _location = location;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get author => _author;

  set author(String value) {
    _author = value;
  }

  LatLng get location => _location;

  set location(LatLng value) {
    _location = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  int get nr_participants => _nr_participants;

  set nr_participants(int value) {
    _nr_participants = value;
  }

  factory RecommendedActivity.fromJson(Map<String, dynamic> json) =>
      RecommendedActivity(
        title: json["title"],
        author: json["author"],
        address: json["address"],
        nr_participants: json["nr_participants"],
        id: json['id'],
        location: LatLng(
          json["location"]["latitude"].toDouble(),
          json["location"]["longitude"].toDouble(),
        ),
      );
}
