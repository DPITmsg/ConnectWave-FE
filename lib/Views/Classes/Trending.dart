class Trending {
  String _title = '';
  String _category = '';
  String _stat_1 = '';
  String _stat_2 = '';
  String _image_url = '';

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  Trending(
      {required title,
      required category,
      required stat_1,
      required stat_2,
      required image_url})
      : _title = title,
        _category = category,
        _stat_1 = stat_1,
        _stat_2 = stat_2,
        _image_url = image_url;

  String get category => _category;

  String get image_url => _image_url;

  set image_url(String value) {
    _image_url = value;
  }

  String get stat_2 => _stat_2;

  set stat_2(String value) {
    _stat_2 = value;
  }

  String get stat_1 => _stat_1;

  set stat_1(String value) {
    _stat_1 = value;
  }

  set category(String value) {
    _category = value;
  }
}
