import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_login_page_ui/Widgets/SocialIcons.dart';
import 'package:flutter_login_page_ui/models/CustomIcons.dart';
import 'package:flutter_login_page_ui/utils/auth.dart';
import 'package:flutter_login_page_ui/data/database_helper.dart';
import 'package:flutter_login_page_ui/models/user.dart';
import 'package:flutter_login_page_ui/screens/login/login_screen_presenter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Home.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen>
    implements LoginScreenContract, AuthStateListener {
  BuildContext _ctx;

  String _email = "Email", _password = "Password";
  final String _facebookURL = 'https://www.facebook.com/TamerBeautyCenter/?ref=br_rs';
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  LoginScreenPresenter _presenter;

  LoginScreenState() {
    _presenter = new LoginScreenPresenter(this);
    var authStateProvider = new AuthStateProvider();
    authStateProvider.subscribe(this);
  }
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      setState(() => _isLoading = true);
      form.save();
      _presenter.doLogin(_email, _password);
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  @override
  onAuthStateChanged(AuthState state) {
    if (state == AuthState.LOGGED_IN)
      Navigator.of(_ctx).pushReplacementNamed("/home");

  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;

    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

    var BaseBackground = new Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Image.asset("assets/background.jpg"),
        ),
        Expanded(
          child: Container(),
        ),
        Image.asset("assets/image_02.png")
      ],
    );
    Widget horizontalLine() => Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            width: ScreenUtil.getInstance().setWidth(120),
            height: 1.0,
            color: Colors.black26.withOpacity(.2),
          ),
        );
    var RowSocailMediaTitle = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        horizontalLine(),
        Text("Social Media",
            style: TextStyle(fontSize: 16.0, fontFamily: "Poppins-Medium")),
        horizontalLine()
      ],
    );
    var RowSocialMedia = new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SocialIcon(
          colors: [
            Color(0xFF102397),
            Color(0xFF187adf),
            Color(0xFF00eaf8),
          ],
          iconData: CustomIcons.facebook,
          onPressed: (){
            _launchURL(_facebookURL);
          },
        ),
        SocialIcon(
          colors: [
            Color(0xFFff4f38),
            Color(0xFFff355d),
          ],
          iconData: CustomIcons.googlePlus,
          onPressed: () {},
        ),
        SocialIcon(
          colors: [
            Color(0xFF17ead9),
            Color(0xFF6078ea),
          ],
          iconData: CustomIcons.twitter,
          onPressed: () {},
        ),
        SocialIcon(
          colors: [
            Color(0xFF00c6fb),
            Color(0xFF005bea),
          ],
          iconData: CustomIcons.linkedin,
          onPressed: () {},
        )
      ],
    );
    var ContainerFormCard = new Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(540),
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
            new Form(
              key: formKey,
              child: new Column(
                children: <Widget>[
                  new TextFormField(
                    onSaved: (val) => _email = val,
                    validator: (val) {
                      return val.length < 1 ? "required" : null;
                    },
                    decoration: InputDecoration(
                        labelText: "Email",
                        icon: Icon(Icons.person),
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 12.0)),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                  new TextFormField(
                    obscureText: true,
                    onSaved: (val) => _password = val,
                    validator: (val) {
                      if (val.length < 1) return "required";
                      return val.length < 6
                          ? "Password must have at least 6 chars"
                          : null;
                    },
                    decoration: new InputDecoration(
                        labelText: "Password",
                        icon: Icon(Icons.lock),
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 12.0)),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(35),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(_ctx).pushReplacementNamed("/forgotPassword");
                  },
                  child: new Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Colors.blue,
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(28)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );

//    var RowSignUp = new Row(
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[
//        Text(
//          "New User? ",
//          style: TextStyle(fontFamily: "Poppins-Medium"),
//        ),
//        InkWell(
//          onTap: () {
//            Navigator.pushReplacement(
//                _ctx, MaterialPageRoute(builder: (BuildContext context) => new Home(user)));
////            Navigator.of(_ctx).pushReplacementNamed("/signup");
//          },
//          child: Text("SignUp",
//              style: TextStyle(
//                  color: Color(0xFF5d74e3), fontFamily: "Poppins-Bold")),
//        )
//      ],
//    );
    return new Scaffold(
      appBar: null,
      key: scaffoldKey,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          BaseBackground,
          new SingleChildScrollView(
            child: new Padding(
                padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
                child: new Column(
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(280),
                    ),
                    ContainerFormCard,
                    SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        InkWell(
                          child: Container(
                            width: ScreenUtil.getInstance().setWidth(330),
                            height: ScreenUtil.getInstance().setHeight(100),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xF1f7b71d),
                                  Color(0xF1f7b71d)
                                ]),
                                borderRadius: BorderRadius.circular(6.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFF6078ea).withOpacity(.3),
                                      offset: Offset(0.0, 8.0),
                                      blurRadius: 8.0)
                                ]),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: _submit,
                                child: Center(
                                  child: Text("SIGNIN",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins-Bold",
                                          fontSize: 18,
                                          letterSpacing: 1.0)),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(100),
                    ),
                    RowSocailMediaTitle,
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(40),
                    ),
                    RowSocialMedia
                  ],
                )),
          ),
        ],
      ),
    );
  }


  @override
  void onLoginSuccess(User user) async {
    _showSnackBar("successfully");
    setState(() {
      _isLoading = false;
      Navigator.pushReplacement(
          _ctx, MaterialPageRoute(builder: (BuildContext context) => new Home(user)));
//      Navigator.of(_ctx).pushReplacementNamed("/home");

    });
    var db = new DatabaseHelper();
    await db.saveUser(user);
    var authStateProvider = new AuthStateProvider();
    authStateProvider.notify(AuthState.LOGGED_IN);


  }

  @override
  void onLoginError(String errorTxt) {

      _showSnackBar(errorTxt);
      setState((){
        _isLoading = false;
//      _showSnackBar('Email or password is not correct!');
      });
      var authStateProvider = new AuthStateProvider();
      authStateProvider.notify(AuthState.LOGGED_OUT);


  }
}
