import 'package:flutter/material.dart';
import 'package:pocketDoctor/screens/doctorDetailScreen.dart';
import 'package:provider/provider.dart';

import '../providers/doctor.dart';

class DoctorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final doctor = Provider.of<Doctor>(context);
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).pushNamed(
          DoctorDetailScreen.routeName,
          arguments: doctor.id,
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
            title: Text(doctor.practiceName),
          ),
        ),
      ),
    );
  }
}
