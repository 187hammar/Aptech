import 'package:flutter/material.dart';

import '../../widget/callList.dart';
import '../../widget/appdrawer.dart';

class ViewCalls extends StatefulWidget {
  static const routeName = '/view-calls';
  @override
  _ViewCallsState createState() => _ViewCallsState();
}

class _ViewCallsState extends State<ViewCalls> {
  bool isDoc = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: isDoc ? Text("Calls") : Text("Responding Doctors")),
      drawer: AppDrawer(),
      body: CallsList(),
    );
  }
}
