import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page_ui/models/user.dart';
import 'package:flutter_login_page_ui/screens/signUp/signUp_screen_presnter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUp> implements SignUpScreenContract {
  BuildContext _ctx;
  String _username, _email, _password, _phoneNumber, _confirmPassword;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      Map<String, String> body = {
        "name": _username,
        "email": _email,
        "phone": _phoneNumber,
        "password": _password,
        "passwordConfirm": _confirmPassword
      };
      print(body);
      _presenter.doSignUp(body);
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  var space = new SizedBox(
    height: ScreenUtil.getInstance().setHeight(30),
  );
  var btnSubmit = new Center(
    child: Text("SUBMIT",
        style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins-Bold",
            fontSize: 18,
            letterSpacing: 1.0)),
  );
  SignUpScreenPresenter _presenter;

  _SignUpScreenState() {
    _presenter = new SignUpScreenPresenter(this);
  }

  void _BackPage() {
    Navigator.of(_ctx).pop();
    Navigator.of(_ctx).pushReplacementNamed("/");
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
              backgroundColor: Colors.amber.withOpacity(0.7),
              title: new Text("Sign Up Page"),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: _BackPage,
              )),
          body: new SingleChildScrollView(
            child: new Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new TextFormField(
                      onSaved: (val) => _username = val,
                      validator: (val) {
                        return val.length < 1 ? "required" : null;
                      },
                      decoration: InputDecoration(
                          labelText: 'username',
                          icon: Icon(Icons.person),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 12.0)),
                    ),
                    space,
                    new TextFormField(
                      onSaved: (val) => _email = val,
                      validator: (val) {
                        return val.length < 1 ? "required" : null;
                      },
                      decoration: InputDecoration(
                          labelText: 'email',
                          icon: Icon(Icons.email),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 12.0)),
                    ),
                    space,
                    new TextFormField(
                      onSaved: (val) => _phoneNumber = val,
                      validator: (val) {
                        if (val.length < 1) return "required";
                        return val.length < 10
                            ? "must have at least 10 numbers"
                            : null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'phone',
                          icon: Icon(Icons.phone),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 12.0)),
                    ),
                    space,
                    new TextFormField(
                      obscureText: true,
                      onSaved: (val) => _password = val,
                      validator: (val) {
                        if (val.length < 1) return "required";
                        return val.length < 6
                            ? "must have at least 6 chars"
                            : null;
                      },
                      decoration: InputDecoration(
                          labelText: 'password',
                          icon: Icon(Icons.lock),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 12.0)),
                    ),
                    space,
                    new TextFormField(
                      obscureText: true,
                      onSaved: (val) => _confirmPassword = val,
                      validator: (val) {
                        if (val.length < 1) return "required";
                        return val.length < 6
                            ? "must have at least 6 chars"
                            : null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          icon: Icon(Icons.lock),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 12.0)),
                    ),
                    space,
                    new Container(
                      width: ScreenUtil.getInstance().setWidth(330),
                      height: ScreenUtil.getInstance().setHeight(100),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xF1f7b71d), Color(0xF1f7b71d)]),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: _submit,
                          child: btnSubmit,
                        ),
                      ),
                    )
                  ],
                )),
          )),
    );
  }

  @override
  void onSignUpError(String errorTxt) {
    _showSnackBar(errorTxt);
  }

  @override
  void onSignUpSuccess(User user) {
    _showSnackBar(user.toString());
    _BackPage();
  }
}
