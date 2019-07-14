import 'package:flutter/material.dart';

class CardChoose extends StatelessWidget {
  IconData icon;
  String name;
  Color color;


  CardChoose(this.icon, this.name,this.color);

  @override
  Widget build(BuildContext context) {
    final title = "Grid List";
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 5,
      height: MediaQuery.of(context).size.width / 2,
      child: ChoiceCard(this.icon, this.name,this.color),
    );
//    return MaterialApp(
//        title: title,
//        debugShowCheckedModeBanner: false,
//        home: Scaffold(
//            backgroundColor: Colors.grey.shade200,
//            body: GridView.count(
//                crossAxisCount: 2,
//                children: List.generate(choices.length, (index) {
//                  return Center(
//                    child: ChoiceCard(choice: choices[index]),
//                  );
//                }))));
  }
}

//class Choice {
//  const Choice({this.title, this.icon});
//
//  final String title;
//  final IconData icon;
//}

//const List<Choice> choices = const <Choice>[
//  const Choice(title: 'Today', icon: Icons.date_range),
//  const Choice(title: 'Tomorrow', icon: Icons.date_range),
//  const Choice(title: 'Dates', icon: Icons.playlist_add_check),
//  const Choice(title: 'Setting', icon: Icons.settings),
//];

class ChoiceCard extends StatelessWidget {
//  const ChoiceCard({Key key, this.choice}) : super(key: key);
//  final Choice choice;
  IconData icon;
  String name;
  Color color;

  ChoiceCard(this.icon, this.name,this.color);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new InkWell(
      onTap: () => {debugPrint("asdasd")},

      child: Card(
          color: Colors.white,
          child: Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(icon, size: 80.0, color: color),
                  Text(name, style: textStyle),
                ]),
          )),
    );
  }
}
