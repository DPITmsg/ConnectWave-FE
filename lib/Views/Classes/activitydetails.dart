import 'dart:convert';

List<ActivityDetails> activityFromJson(String str) {
  dynamic jsonData = json.decode(str);

  if (jsonData is List) {
    return jsonData.map((json) => ActivityDetails.fromJson(json)).toList();
  } else if (jsonData is Map) {
    return [ActivityDetails.fromJson(jsonData as Map<String, dynamic>)];
  } else {
    throw Exception("Invalid JSON data format");
  }
}


String postToJson(List<ActivityDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class ActivityDetails {
  String _date = '';
  String _title = '';
  List<String> _tags = [];
  int _nrParticipants = 0;
  String _category = '';
  double _avgUserRating = 0;
  String _address = '';
  String _description = '';

  ActivityDetails({
    required date,
    required title,
    required tags,
    required nrParticipants,
    required category,
    required avgUserRating,
    required address,
    required description
  })
      :_date = date,
        _title = title,
        _tags = tags,
        _nrParticipants = nrParticipants,
        _category = category,
        _avgUserRating = avgUserRating,
        _address = address,
        _description = description;

  factory ActivityDetails.fromJson(Map<String, dynamic> json) =>
      ActivityDetails(
        date: json["date"],
        title: json["title"],
        tags: List<String>.from(json["tags"]),
        nrParticipants: json["nrParticipants"],
        category: json["category"],
        avgUserRating: json["avgUserRating"],
        address: json["address"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() =>
      {
        "date": date,
        "title": title,
        "tags": tags,
        "nrParticipants": nrParticipants,
        "category": category,
        "avgUserRating": avgUserRating,
        "address": address,
        "description": description,
      };

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  double get avgUserRating => _avgUserRating;

  set avgUserRating(double value) {
    _avgUserRating = value;
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
}