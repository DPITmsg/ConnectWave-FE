import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

List<Address> addressFromJson(String str) {
  dynamic jsonData = json.decode(str);

  if (jsonData is List) {
    return jsonData.map((json) => Address.fromJson(json)).toList();
  } else if (jsonData is Map) {
    return [Address.fromJson(jsonData as Map<String, dynamic>)];
  } else {
    throw Exception("Invalid JSON data format");
  }
}

String postToJson(List<Address> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Address{
  String _country = '';
  String _county = '';
  String _city = '';
  String _streetName = '';
  String _streetNumber = '';
  LatLng _latlng = LatLng(25.1193, 55.3373);

  Address({
    required country,
    required county,
    required city,
    required streetName,
    required streetNumber,
    required latlng,
}):_country = country, _county = county, _city = city, _streetName = streetName, _streetNumber = streetNumber, _latlng = latlng;

  factory Address.fromJson(Map<String, dynamic> json) =>
      Address(
        country: json["country"],
        county: json["county"],
        city: json["city"],
        streetName: json["streetName"],
        streetNumber: json["streetNumber"],
        latlng: json["latlng"],
      );

  Map<String, dynamic> toJson() =>
      {
        "country": country,
        "county": county,
        "city": city,
        "streetName": streetName,
        "streetNumber": streetNumber,
        "latlng": latlng,
      };

  LatLng get latlng => _latlng;

  set latlng(LatLng value) {
    _latlng = value;
  }

  String get streetNumber => _streetNumber;

  set streetNumber(String value) {
    _streetNumber = value;
  }

  String get streetName => _streetName;

  set streetName(String value) {
    _streetName = value;
  }

  String get city => _city;

  set city(String value) {
    _city = value;
  }

  String get county => _county;

  set county(String value) {
    _county = value;
  }

  String get country => _country;

  set country(String value) {
    _country = value;
  }
}