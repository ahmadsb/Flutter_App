import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

//  Future<bool> saveData() async {
//    SharedPreferences preferences = await SharedPreferences.getInstance();
//    return await preferences.setString("SharedUserName", _ValueUserName.text);
//  }
//
//  Future<String> loadData() async {
//    SharedPreferences preferences = await SharedPreferences.getInstance();
//    return preferences.getString("SharedUserName");
//  }

//  setData() {
//    loadData().then((value) {
//      setState(() {
//        _username = value;
//      });
//    });
//  }



  bool _isSelected = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
//      saveData();
//      setData();
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

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
//                Row(
//                  children: <Widget>[
//                    SizedBox(
//                      width: 12.0,
//                    ),
//                    GestureDetector(
//                      onTap: _radio,
//                      child: radioButton(_isSelected),
//                    ),
//                    SizedBox(
//                      width: 8.0,
//                    ),
//                    Text("Remember me",
//                        style: TextStyle(
//                            fontSize: 12, fontFamily: "Poppins-Medium"))
//                  ],
//                ),

                Text(

                  "Forgot Password?",
                  style: TextStyle(
                      color: Colors.blue,
                      fontFamily: "Poppins-Medium",
                      fontSize: ScreenUtil.getInstance().setSp(28)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
