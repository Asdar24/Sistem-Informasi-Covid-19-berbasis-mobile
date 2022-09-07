class Contact {
  int? _id;
  late String _name;
  late String _phone;

  Contact(this._name, this._phone);

  Contact.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _name = map['name'];
    _phone = map['phone'];
  }

  int? get id => _id;
  String get name => _name;
  String get phone => _phone;

  set name(String value) {
    _name = value;
  }

  set phone(String value) {
    _phone = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    // map['id'] = _id;
    map['name'] = name;
    map['phone'] = phone;
    return map;
  }
}
