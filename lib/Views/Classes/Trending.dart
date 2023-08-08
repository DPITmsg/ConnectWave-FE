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
