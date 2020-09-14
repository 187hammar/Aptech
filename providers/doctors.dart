import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './doctor.dart';

class Doctors with ChangeNotifier {
  List<Doctor> _doctorItem = [
    Doctor(
        id: 'dr1',
        fName: 'Masabata',
        lNname: 'Mthetwa',
        practiceName: 'Dr M.Y. Mthetwa',
        practiceAddress: '18 Cannies street Akasia Pretoria',
        practiceField: 'General Practitioner',
        practiceRegistrationNum: 'KK 182837',
        qualifications: 'Doctrane',
        lastCheck: '11 Sep. 2020',
        averageRating: "9/10"),
  ];

  List<Doctor> get doctorItem {
    return [..._doctorItem];
  }

  Doctor findById(String id) {
    return _doctorItem.firstWhere((element) => element.id == id);
  }

  Future<void> addDoctor(Doctor doctor) async {
    const url = 'https://pocketdoctor-aed0a.firebaseio.com/doctors.json';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'id': doctor.id,
          'fName': doctor.fName,
          'lNname': doctor.lNname,
          'practiceName': doctor.practiceName,
          'practiceAddress': doctor.practiceAddress,
          'practiceField': doctor.practiceField,
          'practiceRegistrationNum': doctor.practiceRegistrationNum,
          'qualifications': doctor.qualifications,
          'lastCheck': doctor.lastCheck,
          'averageRating': doctor.averageRating,
        }),
      );
      final newDoctor = Doctor(
        id: json.decode(response.body)['name'],
        fName: doctor.fName,
        lNname: doctor.lNname,
        practiceName: doctor.practiceName,
        practiceAddress: doctor.practiceAddress,
        practiceField: doctor.practiceField,
        practiceRegistrationNum: doctor.practiceRegistrationNum,
        qualifications: doctor.qualifications,
        lastCheck: doctor.lastCheck,
        averageRating: doctor.averageRating,
      );
      _doctorItem.add(newDoctor);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
