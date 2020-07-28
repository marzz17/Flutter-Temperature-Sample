import 'dart:convert';
import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

// import 'package:toggle_switch/toggle_switch.dart';
// ToggleSwitch(
//                 minWidth: 50.0,
//                 cornerRadius: 20,
//                 activeBgColor: Colors.green,
//                 activeTextColor: Colors.white,
//                 inactiveBgColor: Colors.grey,
//                 inactiveTextColor: Colors.white,
//                 labels: ['YES', 'NO'],
//                 icons: [Icons.check, Icons.close],
//                 onToggle: (index) {
//                   print('switched to: $index');
//                 }),
class CreateTemperatureScreen extends StatefulWidget {
  @override
  _CreateTemperature createState() => _CreateTemperature();
}

class _CreateTemperature extends State<CreateTemperatureScreen> {
  double rating = 36.0;
  bool status1 = false;
  bool status2 = false;
  bool status3 = false;
  bool _value1 = false;
  void saveTemperature() {
    Map data = {
      "fkempid": "103",
      "temperature": rating,
      "q1": status1,
      "q2": status2,
      "q3": status3,
      "dateregister": "7/19/2020",
      "accept": _value1
    };

    String body = json.encode(data);
    var url = 'http://10.0.2.2:1338/api/saveEmpTemperature';
    http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
  }

  void _value1Changed(bool value) => setState(() => _value1 = value);

  Future _showAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text('Health Self-Assessment Agreement'),
          content: Text(message),
          actions: <Widget>[
            new FlatButton(
                onPressed: () => Navigator.pop(context), child: new Text('OK'))
          ],
        ));
  }

  Future _showSuccesAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: AlertDialog(
          title: Text('Successfully Submitted'),
          content: Text(message),
          actions: <Widget>[
            FlatButton(onPressed: () => {}, child: Text('Thanks!'))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Submit Temperature"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
              child: Column(
                children: <Widget>[
                  Center(
                      child: Text(
                    "${rating.toStringAsFixed(1)}",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  )),
                  Slider.adaptive(
                    value: rating,
                    onChanged: (newrating) {
                      setState(() => rating = newrating);
                    },
                    min: 0,
                    max: 40,
                    divisions: 160,
                    label: "${rating.toStringAsFixed(1)}",
                  ),
                ],
              ),
            ),
            ListTile(
              leading: CustomSwitch(
                activeColor: Colors.green,
                value: status1,
                onChanged: (value) {
                  setState(() {
                    status1 = value;
                    print("VALUE : $status1");
                  });
                },
              ),
              title: Text(
                  'Do you have symptoms of fever or chills, cough, sore throat, shortness of breath, or any other flu-like symptoms in the past 24 hours or had a temperature that is 37.5 degree Celsius or higher?'),
            ),
            ListTile(
              leading: CustomSwitch(
                activeColor: Colors.green,
                value: status2,
                onChanged: (value) {
                  setState(() {
                    status2 = value;
                    print("VALUE : $status2");
                  });
                },
              ),
              title: Text(
                  'Have you experienced prolonged contact (within 2-3 minutes) at a distance of less than 6 feet - with someone who is suspected or with confirmed case of COVID-19?'),
            ),
            ListTile(
              leading: CustomSwitch(
                activeColor: Colors.green,
                value: status3,
                onChanged: (value) {
                  setState(() {
                    status3 = value;
                    print("VALUE : $status3");
                  });
                },
              ),
              title: Text(
                  'Do you have international/local travel history outside of your region for the last 7-14 days?'),
            ),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.fromLTRB(0, 15.0, 0, 0),
                child: Column(
                  children: <Widget>[
                    new CheckboxListTile(
                      value: _value1,
                      onChanged: _value1Changed,
                      title: Padding(
                        padding: const EdgeInsets.fromLTRB(13.0, 0, 0, 0),
                        child: new Text("Health Self-Assessment Confirmation."),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      subtitle: FlatButton(
                          onPressed: () => _showAlert(context,
                              'I certify that the above statements are true and correct to the best of my knowledge. I hereby authorize Tagum Cooperative to collect and process the data indicated herein for the purpose of effecting control of COVID-19 infection. I understand that my personal information is protected by RA 10173 or the Data Privacy Act of 2012, and that I am required by RA 11469 or the Bayanihan to Heal as One Act, to provide truthful information.'),
                          child: new Text(
                              'I certify that the above statements are true and correct to the best of my knowledge.',
                              style: TextStyle(color: Colors.green))),
                      activeColor: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
                title: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  saveTemperature();
                  Navigator.pop(context);
                  _showSuccesAlert(
                      context, 'Thank You for submmiting you temperature!');
                },
                child: const Text('Submit', style: TextStyle(fontSize: 14)),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
