import 'package:flutter/material.dart';

class SearchTemperature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(title: Text("Search Temperature"), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ]),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("todo.description"),
      ),
    );
  }
}
