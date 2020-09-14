import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../deliverySide/providers/deliveries.dart';

class DeliveryDetailsScreen extends StatefulWidget {
  static const routeName = '/delivery-details';

  @override
  _DeliveryDetailsScreenState createState() => _DeliveryDetailsScreenState();
}

class _DeliveryDetailsScreenState extends State<DeliveryDetailsScreen> {
  Future<void> _onConfirmedClickedHandler() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Confirm Delivery"),
            content: SingleChildScrollView(
                child: ListBody(
              children: <Widget>[
                Text("Do you accept to deliver package?"),
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

  void _onCompleteDelivery() {
    Navigator.of(context).popUntil(ModalRoute.withName('/'));
  }

  @override
  Widget build(BuildContext context) {
    final deliveryId = ModalRoute.of(context).settings.arguments as String;
    final loadedDelivery =
        Provider.of<Deliveries>(context).findById(deliveryId);
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery"),
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
                    loadedDelivery.patientName,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    loadedDelivery.doctorsName,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "To: " + loadedDelivery.toAddress,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "From: " + loadedDelivery.practiceAddress,
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
                    icon: Icon(Icons.call_received),
                    label: Text("Take Delivery"),
                    color: Colors.green[200],
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.done_outline),
                    label: Text(
                      "Delivery Compleate",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: _onCompleteDelivery,
                    color: Colors.green,
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
