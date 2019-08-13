import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_login_page_ui/Home.dart';
import 'package:http/http.dart' as http;

class NetworkUtil {
  // next three lines makes this class a Singleton
  static NetworkUtil _instance = new NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> get(String url) {
    return http.get(url).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url, {Map<String,String> headers, body, encoding})  async{

    print(body);
    headers = {'Content-Type':'application/json; charset=utf-8'};


    return  await http.post(url, body: body, headers: headers)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || body == null) {
        throw new Exception("Email or password is not correct!");
      }


      return _decoder.convert(res);
    });
  }
}
