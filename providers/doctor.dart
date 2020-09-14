import 'package:flutter/material.dart';

class Doctor with ChangeNotifier {
  final String id;
  final String fName;
  final String lNname;
  final String practiceName;
  final String practiceField;
  final String practiceAddress;
  final String qualifications;
  final String practiceRegistrationNum;
  final String averageRating;
  final String lastCheck;

  Doctor({
    @required this.id,
    @required this.fName,
    @required this.lNname,
    @required this.practiceName,
    @required this.practiceField,
    @required this.practiceAddress,
    @required this.qualifications,
    @required this.practiceRegistrationNum,
    @required this.averageRating,
    @required this.lastCheck,
  });
}
