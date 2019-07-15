import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListDates extends StatefulWidget {
  String name;

  ListDates(this.name);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ListDates(name);
  }
}

class _ListDates extends State<ListDates> {
  String name;

  _ListDates(this.name);

  final List<String> Dates = <String>[
    '10:00',
    '11:00',
    '12:30',
    '15:30',
    '10:00',
    '11:00',
    '12:30',
    '15:30',
  ];


  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
//          width: ScreenUtil.getInstance().setWidth(120),
          height: 2.0,
          color: Colors.grey.withOpacity(0.1),
        ),
      );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.amber.withOpacity(0.7),
            title: new Text("$name"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false),
            )),
        body: Container(
          color: Colors.grey.shade200,
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
                  color: Colors.grey.shade200,
                ),
            itemCount: Dates == null ? 0 : Dates.length,
            itemBuilder: (BuildContext build, int index) {
              return Container(
                color: Colors.grey.shade200,
                height: ScreenUtil.getInstance().setWidth(210),
                child: new Container(
//                  padding: EdgeInsets.only(left: 100),
                  child: Column(
                    children: <Widget>[
                      new Container(
                        margin: new EdgeInsets.only(
                            left: 10, right: 4.0, bottom: 4.0, top: 4.0),
                        height: ScreenUtil.getInstance().setWidth(50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Text(
                              Dates[index],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Poppins-Medium",
                                  fontSize: 19),
                            )
                          ],
                        ),
                      ),
                      horizontalLine(),
                      new Container(
                        margin: new EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FlatButton.icon(
                              icon: Icon(
                                Icons.timer,
                                color: Colors.black26,
                              ),
                              //`Icon` to display
                              label: new Text(
                                Dates[index] + " left",
                                style: TextStyle(
                                    color: Colors.black26,
                                    fontFamily: "Poppins-Medium",
                                    fontSize: 16),
                              ),
                              //`Text` to display
//                              onPressed: () {
//                                //Code to execute when Floating Action Button is clicked
//                                //...
//                              },
                            ),
                            FlatButton.icon(
                              icon: Icon(Icons.date_range,
                                  color: Colors.black26),
                              //`Icon` to display
                              label: new Text(
                                "07-15-2019",
                                style: TextStyle(
                                    color: Colors.black26,
                                    fontFamily: "Poppins-Medium",
                                    fontSize: 19),
                              ),
                              //`Text` to display
//                              onPressed: () {
//                                //Code to execute when Floating Action Button is clicked
//                                //...
//                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  width: ScreenUtil.getInstance().setWidth(580),
                  height: ScreenUtil.getInstance().setWidth(190),
                  margin: new EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(
                    color: Colors.amber.withOpacity(0.4),
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.circular(8.0),
                    boxShadow: <BoxShadow>[],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
