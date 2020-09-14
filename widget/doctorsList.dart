import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './doctorCard.dart';
import '../providers/doctors.dart';

class DoctorsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final doctorData = Provider.of<Doctors>(context);
    final doctors = doctorData.doctorItem;
    return ListView.builder(
      itemCount: doctors.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: doctors[i],
        child: DoctorCard(),
      ),
    );
  }
}
