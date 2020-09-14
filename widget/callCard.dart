import 'package:flutter/material.dart';
import 'package:pocketDoctor/screens/patientDetailScreen.dart';
import 'package:provider/provider.dart';

import '../providers/calls/call.dart';

class CallCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final call = Provider.of<Call>(context);
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).pushNamed(
          PatientDetailScreen.routeName,
          arguments: call.id,
        )
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 3,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            title: Text(call.patientName),
            subtitle: Text(call.address),
          ),
        ),
      ),
    );
  }
}
