import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/patients/patients.dart';

class PatientDetailScreen extends StatefulWidget {
  static const routeName = '/patient-details';

  @override
  _PatientDetailScreenState createState() => _PatientDetailScreenState();
}

class _PatientDetailScreenState extends State<PatientDetailScreen> {
  Future<void> _onConfirmedClickedHandler() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Confirm call"),
            content: SingleChildScrollView(
                child: ListBody(
              children: <Widget>[
                Text(
                    "The Patient will recieve your confirmation and the dirrections will be sent to you."),
                Text("The patient is patiently anticipating your arrival."),
              ],
            )),
            actions: <Widget>[
              FlatButton(
                child: Text('Confirm'),
                onPressed: () {
                  Navigator.of(context).popUntil(ModalRoute.withName('/'));
                },
              )
            ],
          );
        });
  }

  Future<void> _onRejectClickedHandler() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Reject call"),
            content: SingleChildScrollView(
                child: ListBody(
              children: <Widget>[
                Text("Are you sure you would like to reject the call?"),
              ],
            )),
            actions: <Widget>[
              FlatButton(
                color: Colors.white,
                textColor: Colors.red,
                child: Text('Yes'),
                onPressed: () {
                  Navigator.of(context).popUntil(ModalRoute.withName('/'));
                },
              ),
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final patientId = ModalRoute.of(context).settings.arguments as String;
    final loadedPatient = Provider.of<Patients>(context).findById(patientId);
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedPatient.fullName),
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green[100],
              Colors.amber[100],
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 1],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    loadedPatient.address,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    loadedPatient.phoneNum,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    loadedPatient.lastCall,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: _onConfirmedClickedHandler,
                    icon: Icon(Icons.call),
                    label: Text("Confirm Call"),
                    color: Colors.green[200],
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.cancel),
                    label: Text("Cancel call"),
                    onPressed: _onRejectClickedHandler,
                    color: Colors.red,
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
