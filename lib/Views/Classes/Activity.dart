class Activity {
  String _title = '';
  String _author = '';
  String _date = '';
  String _end_date = '';
  String _time = '';
  String _location = '';
  int _number_participants = 2;
  String _descrpition = '';
  String _category = '';
  List<String> _tags = [];

  String _author_id = '';

  Activity(
      {required title,
      required author,
      required date,
      required end_date,
      required location,
      required number_participants,
      required descrpition,
      required author_id,
      required tags,
      required category,
      required time})
      : _title = title,
        _author = author,
        _date = date,
        _end_date = end_date,
        _time = time,
        _location = location,
        _number_participants = number_participants,
        _descrpition = descrpition,
        _category = category,
        _tags = tags,
        _author_id = author_id;

  String get end_date => _end_date;

  set end_date(String value) {
    _end_date = value;
  }

  String get time => _time;

  set time(String value) {
    _time = value;
  }

 String get author_id => _author_id;

  set author_id(String value) {
    _author_id = value;
  }

  String get descrpition => _descrpition;

  set descrpition(String value) {
    _descrpition = value;
  }

  int get number_participants => _number_participants;

  set number_participants(int value) {
    _number_participants = value;
  }

  String get location => _location;

  set location(String value) {
    _location = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get author => _author;

  set author(String value) {
    _author = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get category => _category;

  List<String> get tags => _tags;

  set tags(List<String> value) {
    _tags = value;
  }

  set category(String value) {
    _category = value;
  }


  Map<String, dynamic> toJson() => <String, dynamic>{
    'title': _title,
    'address': _location,
    'nr participants': _number_participants.toString(),
    'date':_date,
    'end_date':_end_date,
    'time':_time,
    'description':_descrpition,
    'category':_category,
    'tags': _tags
  };

  /*Map<String, dynamic> tagsToJson() => <String, dynamic>{
    'tags':tags,
  };*/
}
