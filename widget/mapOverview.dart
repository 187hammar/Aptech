import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/availableDoctorsScreen.dart';
import '../doctors-side/doctor-screens/viewCalls.dart';
import '../deliverySide/deliveryHome.dart';
import '../providers/calls/calls.dart';

class MapOverview extends StatelessWidget {
  static const routeName = '/map-overview';
  @override
  Widget build(BuildContext context) {
    final call = Provider.of<Calls>(context).findById("p1");

    bool doctor = true;
    bool deliver = false;
    bool patient = false;
    print(call.sendCall);
    double maxHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          height: maxHeight * 0.825,
        ),
        doctor
            ? FlatButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed(ViewCalls.routeName);
                },
                icon: Icon(Icons.view_headline),
                label: Text("View Calls"),
              )
            : SizedBox(),
        deliver
            ? FlatButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed(DeliveryHomeScreen.routeName);
                },
                icon: Icon(Icons.directions_run),
                label: Text("Deliveries"))
            : SizedBox(),
        patient
            ? Row(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(AvailableDoctorsScreen.routeName);
                    },
                    icon: Icon(Icons.healing),
                    label: Text("Available Doctors"),
                  ),
                  FlatButton.icon(
                    icon: Icon(
                      Icons.notification_important,
                      color: Colors.red,
                    ),
                    label: Text("Call E.M.S"),
                    onPressed: null,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              )
            : SizedBox(),
      ],
    );
  }
}
