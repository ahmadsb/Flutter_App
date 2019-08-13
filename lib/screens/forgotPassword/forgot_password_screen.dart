import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page_ui/models/user.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'forgot_password_screen_presenter.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordState();
  }
}

class _ForgotPasswordState extends State<ForgotPassword>
    implements ForgotPasswordContract {
  BuildContext _ctx;
  String _email;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  ForgotPasswordPresenter _presenter;

  void _BackPage() {
    Navigator.of(_ctx).pop();
    Navigator.of(_ctx).pushReplacementNamed("/");
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(
        new SnackBar(content: new Text(text), duration: Duration(seconds: 3)));
  }

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      Map<String, String> body = {
        "email": _email,
      };
      print(body);
      _presenter.doForgotPassword(body);
    }
  }

  _ForgotPasswordState() {
    _presenter = new ForgotPasswordPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var btnSubmit = new Center(
      child: Text("SEND",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins-Bold",
              fontSize: 18,
              letterSpacing: 1.0)),
    );
    var sendEmail = new Container(
      width: ScreenUtil.getInstance().setWidth(330),
      height: ScreenUtil.getInstance().setHeight(100),
      decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xF1f7b71d), Color(0xF1f7b71d)]),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: new Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _submit,
          child: btnSubmit,
        ),
      ),
    );
    var message = new TextFormField(
      onSaved: (val) => _email = val,
      validator: (val) {
        return val.length < 1 ? "required" : null;
      },
      decoration: InputDecoration(
          labelText: 'Please, Enter your email to reset password!',
          icon: Icon(Icons.email),
          hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
    );
    var space = new SizedBox(
      height: ScreenUtil.getInstance().setHeight(30),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
              backgroundColor: Colors.amber.withOpacity(0.7),
              title: new Text("Forgot Password Page"),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: _BackPage,
              )),
          body: new Form(
            key: formKey,
            child: new Column(
              children: <Widget>[space, message, space, sendEmail],
            ),
          )),
    );
    ;
  }

  @override
  void onForgotPasswordError(String errorTxt) {
    _showSnackBar(errorTxt);
  }

  @override
  void onForgotPasswordSuccess(String msg) {
    _showSnackBar(msg.toString());

    _BackPage();
  }
}
