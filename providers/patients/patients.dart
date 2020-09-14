import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './patient.dart';

class Patients with ChangeNotifier {
  List<Patient> _patientItem = [
    Patient(
      id: 'p1',
      fullName: 'Thabo Mponya',
      address: '10 Cannies street Akasia Pretoria',
      phoneNum: "0624446016",
      lastCall: '11 Sep. 2020',
    )
  ];

  final String authToken;

  Patients(this.authToken, this._patientItem);

  List<Patient> get patientItem {
    return [..._patientItem];
  }

  Patient findById(String id) {
    return _patientItem.firstWhere((element) => element.id == id);
  }

  Future<void> addDoctor(Patient patient) async {
    const url = 'https://pocketdoctor-aed0a.firebaseio.com/doctors.json';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'id': patient.id,
          'fullName': patient.fullName,
          'address': patient.address,
          'phoneNum': patient.phoneNum,
          'lastCall': patient.lastCall,
        }),
      );
      final newPatient = Patient(
        id: json.decode(response.body)['name'],
        fullName: patient.fullName,
        address: patient.address,
        phoneNum: patient.phoneNum,
        lastCall: patient.lastCall,
      );
      _patientItem.add(newPatient);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
