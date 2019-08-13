import 'package:flutter/material.dart';
import 'package:flutter_login_page_ui/utils/network_util.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_login_page_ui/models/user.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Home.dart';

class FormCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Box();
  }
}

class Box extends State<FormCard> {
  final _ValueUserName = TextEditingController();
  final _ValuePassword = TextEditingController();
  String _username = "Username";
  String _password = "Password";



  @override
  Widget build(BuildContext context) {
//    setData();
    return new Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(500),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Login",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(45),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            TextField(
              controller: _ValueUserName,
              decoration: InputDecoration(
                  labelText: "$_username",
                  icon: Icon(Icons.person),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            TextField(
              controller: _ValuePassword,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "$_password",
                  icon: Icon(Icons.lock),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(35),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Colors.blue,
                      fontFamily: "Poppins-Medium",
                      fontSize: ScreenUtil.getInstance().setSp(28)),
                ),
                new RaisedButton(
                  child: new Text(
                    "Click me",
                  ),
                  onPressed: () async {
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

//Widget radioButton(bool isSelected) => Container(
//  width: 16.0,
//  height: 16.0,
//  padding: EdgeInsets.all(2.0),
//  decoration: BoxDecoration(
//      shape: BoxShape.circle,
//      border: Border.all(width: 2.0, color: Colors.black)),
//  child: isSelected
//      ? Container(
//    width: double.infinity,
//    height: double.infinity,
//    decoration:
//    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
//  )
//      : Container(),
//);
