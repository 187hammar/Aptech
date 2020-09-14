import 'package:flutter/material.dart';

import '../widget/appdrawer.dart';
import '../widget/mapOverview.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool docAvailable = false;
  bool isDoctor = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pocket Doctor"), actions: <Widget>[
        isDoctor
            ? Switch(
                value: docAvailable,
                onChanged: (value) {
                  setState(() {
                    docAvailable = value;
                  });
                },
                activeTrackColor: Colors.grey,
                activeColor: Colors.lime,
              )
            : Divider(),
      ]),
      drawer: AppDrawer(),
      body: MapOverview(),
    );
  }
}
