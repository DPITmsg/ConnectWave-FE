class Address{
  String _country = '';
  String _county = '';
  String _city = '';
  String _streetName = '';
  int _streetNumber = 0;

  Address({
    required country,
    required county,
    required city,
    required streetName,
    required streetNumber
}):_country = country, _county = county, _city = city, _streetName = streetName, _streetNumber = streetNumber;

  int get streetNumber => _streetNumber;

  set streetNumber(int value) {
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