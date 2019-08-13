import 'package:flutter/material.dart';
import 'package:flutter_login_page_ui/utils/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Widgets/FormCard.dart';
import 'Widgets/SocialIcons.dart';
import 'package:flutter_login_page_ui/models/CustomIcons.dart';
import 'package:flutter_login_page_ui/Home.dart';

void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Barber App',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }


}
