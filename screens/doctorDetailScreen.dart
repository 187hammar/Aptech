import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/doctors.dart';

class DoctorDetailScreen extends StatefulWidget {
  static const routeName = '/doctor-details';

  @override
  _DoctorDetailScreenState createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  Future<void> _onClickedHandler() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Await Doctor's response"),
            content: SingleChildScrollView(
                child: ListBody(
              children: <Widget>[
                Text(
                    "The doctor will recieve your request and will soon respond."),
                Text("Please await Doctor's Response."),
              ],
            )),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () =>
                    {Navigator.of(context).popUntil(ModalRoute.withName('/'))},
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final doctorId = ModalRoute.of(context).settings.arguments as String;
    final loadedDoctor =
        Provider.of<Doctors>(context, listen: false).findById(doctorId);
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedDoctor.practiceName),
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green[100],
              Colors.blueGrey[200],
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 1],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  loadedDoctor.fName,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  loadedDoctor.lNname,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.black54,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    loadedDoctor.practiceName,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    loadedDoctor.practiceAddress,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    loadedDoctor.practiceField,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    loadedDoctor.practiceRegistrationNum,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    loadedDoctor.qualifications,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    loadedDoctor.averageRating,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: _onClickedHandler,
                    icon: Icon(Icons.add_call),
                    label: Text("Call Doctor"),
                    color: Colors.green[200],
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.cancel),
                    label: Text("Cancel call"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
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
