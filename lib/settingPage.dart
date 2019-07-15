import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page_ui/Home.dart' as prefix0;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Home.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _SettingPage();
  }
}

class _SettingPage extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.amber.withOpacity(0.7),
              title: new Text("Setting Page"),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (myContext) => new Home()))
                    },
              )),
          body: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'username',
                      icon: Icon(Icons.person),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'phone number',
                      icon: Icon(Icons.phone),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Image',
                      icon: Icon(Icons.image),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'password',
                      icon: Icon(Icons.lock),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'confirm password',
                      icon: Icon(Icons.lock),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(90),
                ),
                Container(
                  width: ScreenUtil.getInstance().setWidth(330),
                  height: ScreenUtil.getInstance().setHeight(100),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xF1f7b71d),
                        Color(0xF1f7b71d)
                      ]),
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: [
//                        BoxShadow(
//                            color: Color(0xFF6078ea).withOpacity(.3),
//                            offset: Offset(0.0, 8.0),
//                            blurRadius: 8.0)
                      ]),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new Home()));
                      },
                      child: Center(
                        child: Text("SUBMIT",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins-Bold",
                                fontSize: 18,
                                letterSpacing: 1.0)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
