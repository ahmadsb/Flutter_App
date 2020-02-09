class User {
  String _email;
  String _password;
  String _name;
  String _phoneNumber;
  String _role;
  User(this._email, this._password,this._name,this._phoneNumber,this._role);

  User.map(dynamic obj) {
    this._email = obj["email"];
    this._password = obj["password"];
    this._name = obj["name"];
    this._phoneNumber = obj["phone"];
    this._role = obj["role"];

  }

  String get getEmail => _email;
  String get getPassword => _password;
  String get getName => _name;
  String get getPhoneNumber => _phoneNumber;
  String get getRole => _role;


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["email"] = _email;
    map["password"] = _password;
    map["name"] = _name;
    map["phoneNumber"] = _phoneNumber;
    map["role"] = _role;

    return map;
  }
}