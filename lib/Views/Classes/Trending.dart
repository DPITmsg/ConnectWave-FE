import 'dart:convert';

List<Trending> activityFromJson(String str) {
  dynamic jsonData = json.decode(str);

  if (jsonData is List) {
    return jsonData.map((json) => Trending.fromJson(json)).toList();
  } else if (jsonData is Map) {
    return [Trending.fromJson(jsonData as Map<String, dynamic>)];
  } else {
    throw Exception("Invalid JSON data format");
  }
}


String postToJson(List<Trending> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Trending {
  String _title = '';
  String _category = '';
  List <String> _stats = [];

  String _image_url = '';

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  Trending({required title,
    required category,
    required stats,
    required image_url})
      : _title = title,
        _category = category,
        _stats = stats,
        _image_url = image_url;

  factory Trending.fromJson(Map<String, dynamic> json) =>
      Trending(
        title: json["title"],
        category: json["category"],
        stats: List<String>.from(json["stats"]),
        image_url: json["image_url"],
      );

  Map<String, dynamic> toJson() =>
      {
        "title": title,
        "category": category,
        "stats": stats,
        "image_url": image_url
      };

  String get category => _category;

  String get image_url => _image_url;

  set image_url(String value) {
    _image_url = value;
  }


  List<String> get stats => _stats;

  set stats(List<String> value) {
    _stats = value;
  }

  set category(String value) {
    _category = value;
  }
}
