

class RecommendedActivity {
  String _title = '';
  String _author = '';
  String _address = '';
  int _id = 0;

  RecommendedActivity(
      {required title, required author, required address, required id})
      : _title = title,
        _author = author,
        _address = address,
        _id = id;

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

  String get title => _title;

  set title(String value) {
    _title = value;
  }
}
