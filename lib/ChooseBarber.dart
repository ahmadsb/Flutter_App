import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Widgets/BarbersList.dart';

class ChooseBarber extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ChooseBarber();
  }
}

class _ChooseBarber extends State<ChooseBarber> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MaterialApp(
        color: Colors.grey,
        home: new BarbersList(),
      ),
    );
  }
}
