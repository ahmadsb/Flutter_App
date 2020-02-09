import 'package:flutter/material.dart';
import 'package:flutter_login_page_ui/screens/forgotPassword/forgot_password_screen.dart';
import 'package:flutter_login_page_ui/screens/login/login_screen.dart';
import 'package:flutter_login_page_ui/screens/signUp/signup_screen.dart';
import '../Home.dart';
import '../settingPage.dart';

final routes = {
  '/settingPage': (BuildContext context) => new SettingPage(),
  '/forgotPassword': (BuildContext context) => new ForgotPassword(),
//  '/signup': (BuildContext context) => new SignUp(),
  '/login': (BuildContext context) => new LoginScreen(),
//  '/home': (BuildContext context) => new Home(),
  '/': (BuildContext context) => new LoginScreen(),
};
