import 'package:flutter/material.dart';
import 'package:flutter_login_page_ui/screens/login/login_screen.dart';

import '../Home.dart';

final routes = {
  '/login':         (BuildContext context) => new LoginScreen(),
  '/home':         (BuildContext context) => new Home(),
  '/' :          (BuildContext context) => new LoginScreen(),
};