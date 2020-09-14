import 'package:flutter/material.dart';
import 'package:pocketDoctor/widget/doctorsList.dart';

import '../widget/appdrawer.dart';

class AvailableDoctorsScreen extends StatefulWidget {
  static const routeName = '/available-Doctors';
  @override
  _AvailableDoctorsScreenState createState() => _AvailableDoctorsScreenState();
}

class _AvailableDoctorsScreenState extends State<AvailableDoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Doctors"),
      ),
      drawer: AppDrawer(),
      body: DoctorsList(),
    );
  }
}
