import 'package:flutter/material.dart';

class Uppermenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 70.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CircleAvatar(
              radius: 40,
              backgroundColor: Colors.lightBlue,
              child: CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              )),
        ],
      ),
    );
  }
}
