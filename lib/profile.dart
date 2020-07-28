import 'package:flutter/material.dart';

class Profilepic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 3.0, 25.0, 10.0),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.white30,
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
          ),
          Text(
            'Jelmar Cambongga',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          Text(
            'ICT Specialist I',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12.0, color: Colors.white),
          )
        ],
      ),
    );
  }
}
