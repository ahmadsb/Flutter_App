import 'package:flutter_login_page_ui/utils/network_util.dart';
import 'package:flutter_login_page_ui/models/user.dart';
import 'dart:convert';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();

  static final BASE_URL = "http://192.168.1.8:3000/api/v1/users";
  static final LOGIN_URL = BASE_URL + "/login";

  Future<User> login(String email, String password) {
    return _netUtil
        .post(LOGIN_URL,
            body: jsonEncode({"email": email, "password": password}))
        .then((dynamic res) {
          print(res["user"]);
      print(res.toString());
      if (res["status"] == 'error') throw new Exception(res["error_msg"]);
      return new User.map(res['data']['user']);
    });
  }
}
