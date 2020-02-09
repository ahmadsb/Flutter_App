import 'package:flutter/cupertino.dart';
import 'package:flutter_login_page_ui/utils/network_util.dart';
import 'package:flutter_login_page_ui/models/user.dart';
import 'dart:convert';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();

  static final BASE_URL = "http://192.168.1.24:3000/api/v1/users";
  static final LOGIN_URL = BASE_URL + "/login";
  static final SIGN_UP = BASE_URL + "/signup";
  static final FORGOT_PASSWORD = BASE_URL + "/forgotPassword";

  Future<User> login(String email, String password) {
    return _netUtil
        .post(LOGIN_URL,
            body: jsonEncode({"email": email, "password": password}))
        .then((dynamic res) {
      print("debug here"+res["data"]["user"].toString());
      print(res.toString());

      if (res["status"] == 'error') {
        throw new Exception(res["error_msg"]);
      }
      return new User.map(res['data']['user']);
    });
  }

  Future<User> signUp(Map<String, String> body) {
    return _netUtil.post(SIGN_UP, body: jsonEncode(body)).then((dynamic res) {
      if (res["status"] == 'error') throw new Exception(res["error_msg"]);
      return new User.map(res['data']['user']);
    });
  }

  Future<String> forgotPassword(Map<String, String> body) {
    return _netUtil
        .post(FORGOT_PASSWORD, body: jsonEncode(body))
        .then((dynamic res) {
      if (res["status"] == 'error') throw new Exception(res["error_msg"]);
      return res["message"];
    });
  }
}
