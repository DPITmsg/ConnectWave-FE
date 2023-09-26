import 'dart:convert';

import 'activitydetails.dart';

List<ActivityHistory> activityHistoryFromJson(String str) {
  List<dynamic> jsonData = json.decode(str);

  return jsonData.map((json) => ActivityHistory.fromJson(json)).toList();
}


class ActivityHistory extends ActivityDetails{
  double _avgUserRating = 0.0;

  ActivityHistory({
    required id,
    required date,
    required endDate,
    required time,
    required author,
    required title,
    required tags,
    required participants,
    required category,
    required address,
    required description,
    required location,
    required avgUserRating,
  }) : super(
    id: id,
    date: date,
    endDate: endDate,
    time: time,
    author: author,
    title: title,
    tags: tags,
    participants: participants,
    category: category,
    address: address,
    description: description,
    location: location,
  ) {
    _avgUserRating = avgUserRating;
  }

  double get avgUserRating => _avgUserRating;

  set avgUserRating(double value) {
    _avgUserRating = value;
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = super.toJson();
    json["avgUserRating"] = _avgUserRating;
    return json;
  }

  factory ActivityHistory.fromJson(Map<String, dynamic> json) {
    final activityDetails = ActivityDetails.fromJson(json);

    return ActivityHistory(
      id: activityDetails.id,
      date: activityDetails.date,
      endDate: activityDetails.endDate,
      time: activityDetails.time,
      author: activityDetails.author,
      title: activityDetails.title,
      tags: activityDetails.tags,
      participants: activityDetails.participants,
      category: activityDetails.category,
      address: activityDetails.address,
      description: activityDetails.description,
      location: activityDetails.location,
      avgUserRating: json["avgUserRating"],
    );
  }
}
