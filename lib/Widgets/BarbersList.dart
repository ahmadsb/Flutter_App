import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page_ui/Widgets/ListDates.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BarbersList extends StatelessWidget {
  final List<String> photos = <String>[
    'assets/barber1.jpg',
    'assets/barber2.jpg',
    'assets/barber3.jpg',
    'assets/barber4.jpg',
  ];

  final List<String> userData = <String>[
    'Tamer Shehadeh',
    'Motasem AbuNab',
    'Basel Shehadeh',
    'Mashhour King',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.amber.withOpacity(0.7),
              title: new Text("Choose Barber"),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context, false),
              )),
          body: Container(
            color: Colors.grey.shade200,
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: userData == null ? 0 : userData.length,
              itemBuilder: (BuildContext build, int index) {
                return new InkWell(
                  onTap: () => {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new ListDates(userData[index])))
                      },
                  child: Container(
//                    color: Colors.grey.shade400,
                      height: ScreenUtil.getInstance().setWidth(290),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          new Stack(
                            children: <Widget>[
                              new Container(
                                padding: EdgeInsets.only(left: 100),
                                child: Row(
                                  children: <Widget>[
                                    new Text(
                                      userData[index],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 19),
                                    )
                                  ],
                                ),
                                width: ScreenUtil.getInstance().setWidth(580),
                                height: ScreenUtil.getInstance().setWidth(190),
                                margin:
                                    new EdgeInsets.only(left: 60.0, top: 30.0),
                                decoration: new BoxDecoration(
                                  color: Colors.amber.withOpacity(0.4),
                                  shape: BoxShape.rectangle,
                                  borderRadius: new BorderRadius.circular(8.0),
                                  boxShadow: <BoxShadow>[],
                                ),
                              ),
                              new Container(
                                margin:
                                    new EdgeInsets.symmetric(vertical: 12.0),
                                alignment: FractionalOffset.centerLeft,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: <BoxShadow>[
                                      new BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 12,
                                        offset: new Offset(0.0, 10.0),
                                      ),
                                    ],
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(photos[index]))),
                                child: new Image(
                                  image: new AssetImage(''),
                                  height: 140.0,
                                  width: 140.0,
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                );
              },
            ),
          ),
        ));
  }
}
