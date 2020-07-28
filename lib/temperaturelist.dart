import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Temperaturelist extends StatefulWidget {
  @override
  _Temperaturelist createState() => _Temperaturelist();
}

class _Temperaturelist extends State<Temperaturelist> {
  final String apiUrl = "http://10.0.2.2:1338/api/getEmpTemperature";
  Future<List<dynamic>> getEmployeeTemperature() async {
    var response = await http.get(apiUrl);
    return json.decode(response.body);
  }

  String _temperature(dynamic user) {
    return user['dateregister'] + ' ' + user['timeregister'];
  }

  Future _showDetails(BuildContext context, String message, String temperature,
      String date) async {
    return showDialog(
        context: context,
        child: AlertDialog(
          title: Text(
            message + ' ' + date,
            style: TextStyle(fontSize: 18.0),
          ),
          content: Text(
            temperature + '°',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.green),
          ),
          actions: <Widget>[
            FlatButton(onPressed: () => {}, child: Text('Okay!'))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: getEmployeeTemperature(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        onTap: () => _showDetails(
                            context,
                            'Hurray!',
                            snapshot.data[index]['temperature'].toString(),
                            _temperature(snapshot.data[index])),
                        leading: snapshot.data[index]['temperature'] >= 36.5
                            ? Icon(
                                Icons.healing,
                                color: Colors.red,
                                size: 40.0,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: Colors.green,
                                size: 40.0,
                              ),
                        title: Text(_temperature(snapshot.data[index])),
                        subtitle: Text(
                            snapshot.data[index]['temperature'] >= 36.5
                                ? 'Advise to see the doctor!'
                                : 'Great, Please stay healthy!'),
                        trailing: Text(
                          snapshot.data[index]['temperature'].toString() + '°',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: snapshot.data[index]['temperature'] >= 36.5
                                  ? Colors.red
                                  : Colors.green),
                        ),
                      )
                    ],
                  ),
                );
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

//  Icon(
//                 Icons.favorite,
//                 color: Colors.pink,
//                 size: 40.0,
//               ),
//
