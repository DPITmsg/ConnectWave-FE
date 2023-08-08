class ActivityDetails{
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
}):_date = date, _title = title, _tags = tags, _nrParticipants = nrParticipants, _category = category, _avgUserRating = avgUserRating, _address = address, _description = description;

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