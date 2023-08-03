
class Activity {
  String _title = '';
  String _author = '';
  String _date = '';
  String _location = '';
  int _number_participants = 2;
  String _descrpition = '';

  //TO DO add tag list
  int _creator_id = 0;

  Activity(
      {required title,
      required author,
      required date,
      required location,
      required number_participants,
      required descrpition,
      required creator_id})
      : _title = title,
        _author = author,
        _date = date,
        _location = location,
        _number_participants = number_participants,
        _descrpition = descrpition,_creator_id = creator_id;

  int get creator_id => _creator_id;

  set creator_id(int value) {
    _creator_id = value;
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
}
