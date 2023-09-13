class Friend{
  String _name = '';
  String _pfp = '';

  Friend({required name, required pfp}): _name = name, _pfp = pfp;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get pfp => _pfp;

  set pfp(String value) {
    _pfp = value;
  }

  factory Friend.fromJson(Map<String, dynamic> json) =>
      Friend(name: json["name"], pfp: json["pfp"]);
}