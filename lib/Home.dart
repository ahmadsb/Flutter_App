import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page_ui/settingPage.dart';
import 'package:flutter_login_page_ui/utils/auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ChooseBarber.dart';
import 'Widgets/CardChoose.dart';
import 'Widgets/BarbersList.dart';
import 'Widgets/SliderImages.dart';
import 'data/database_helper.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new home();
  }
}

class home extends State<Home> implements AuthStateListener {
  BuildContext _ctx;

  String currentProfilePic = "assets/ahmad.jpg";
  String otherProfilePic = "assets/drawer.png";

  void switchAccounts() {
    String picBackup = currentProfilePic;
    this.setState(() {
      currentProfilePic = otherProfilePic;
      otherProfilePic = picBackup;
    });
  }

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 2.0,
          color: Colors.black26.withOpacity(0.3),
        ),
      );

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    final TextStyle textStyle = Theme.of(context).textTheme.display1;

    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            backgroundColor: Colors.amber.withOpacity(0.7),
            title: new Text("Home Page"),
//              leading: IconButton(
//                icon: Icon(Icons.arrow_back),
//                onPressed: () => Navigator.pop(context, false),
//              )
          ),
          drawer: new Drawer(
            child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountEmail: new Text("ahmadsb1994@gmail.com"),
                  accountName: new Text("Ahmad Sabbah"),
                  currentAccountPicture: new GestureDetector(
                    child: new Container(
                      margin: new EdgeInsets.symmetric(vertical: 0.0),
                      alignment: FractionalOffset.centerLeft,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
//                          boxShadow: <BoxShadow>[
//                            new BoxShadow(
//                              color: Colors.grey,
//                              blurRadius: 9,
//                              offset: new Offset(0.0, 10.0),
//                            ),
//                          ],
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(currentProfilePic))),
                    ),
                    onTap: () => print("This is your current account."),
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.amber.withOpacity(0.7),

                    image:
                        new DecorationImage(image: AssetImage(otherProfilePic)),

                  ),
                ),
                new ListTile(
                    title: new Text("Add User"),
                    leading: new Icon(Icons.group_add),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new Text("First Page")));
                    }),
                new ListTile(
                    title: new Text("Notification"),
                    leading: new Icon(Icons.notifications),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new Text("First Page")));
                    }),
                new ListTile(
                    title: new Text("About us"),
                    leading: new Icon(Icons.group),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new Text("Second Page")));
                    }),
                new ListTile(
                    title: new Text("Settings"),
                    leading: new Icon(Icons.settings),
                    onTap: () {
//                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new SettingPage()));
                    }),
                new Divider(),
                new ListTile(
                  title: new Text("Log out"),
                  leading: new Icon(Icons.exit_to_app),
                  onTap: () => {onAuthStateChanged(AuthState.LOGGED_OUT)},
                ),
              ],
            ),
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  height: ScreenUtil.getInstance().setWidth(450),
                  child: Container(
                    child: new SliderImages(),
                  ),
                ),
                Container(
                  color: Colors.grey.shade200,
                  child: InkWell(
                    onTap: () => {},
                    child: Container(
                      color: Colors.grey.shade200,
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 5,
                            height: MediaQuery.of(context).size.width / 2,
                            child: Card(
                                color: Colors.white,
                                child: Center(
                                    child: InkWell(
                                  onTap: () => {
                                        Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                    new BarbersList()))
                                      },
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.date_range,
                                            size: 80.0,
                                            color:
                                                Colors.amber.withOpacity(0.5)),
                                        Text('Today', style: textStyle),
                                      ]),
                                ))),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 2 - 5,
                              height: MediaQuery.of(context).size.width / 2,
                              child: InkWell(
                                onTap: () => {
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) =>
                                                  new BarbersList()))
                                    },
                                child: Card(
                                    color: Colors.white,
                                    child: Center(
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(Icons.date_range,
                                                size: 80.0,
                                                color: Colors.amber
                                                    .withOpacity(0.5)),
                                            Text('Tomorrow', style: textStyle),
                                          ]),
                                    )),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey.shade200,
                  child: InkWell(
                    onTap: () => {},
                    child: Container(
                      color: Colors.grey.shade200,
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 5,
                            height: MediaQuery.of(context).size.width / 2,
                            child: Card(
                                color: Colors.white,
                                child: Center(
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.playlist_add_check,
                                            size: 80.0,
                                            color: Colors.green.shade400),
                                        Text('Dates', style: textStyle),
                                      ]),
                                )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 5,
                            height: MediaQuery.of(context).size.width / 2,
                            child: Card(
                                color: Colors.white,
                                child: Center(
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.location_on,
                                            size: 80.0,
                                            color: Colors.blue.shade400),
                                        Text('Location', style: textStyle),
                                      ]),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
//                Expanded(
//                  child: Container(
//                    color: Colors.grey.shade200,
//                  ),
//                )
              ],
            ),
          )),
    );
  }

  @override
  void onAuthStateChanged(AuthState state) async {
    if (state == AuthState.LOGGED_OUT) {
      var db = new DatabaseHelper();
      await db.deleteUsers();
      Navigator.of(_ctx).pushReplacementNamed("/");
    }
  }
}
