import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './call.dart';

class Calls with ChangeNotifier {
  List<Call> _callItems = [
    Call(
      id: 'p1',
      patientName: 'Thabo Mponya',
      address: '10 Cannies street Akasia Pretoria',
      sendCall: false,
      callAccepted: false,
      callRejected: false,
    ),
  ];

  List<Call> get callItems {
    return [..._callItems];
  }

  Call findById(String id) {
    return _callItems.firstWhere((element) => element.id == id);
  }

  void updateCalls(String id, Call newCall) {
    final callIndex = _callItems.indexWhere((cal) => cal.id == id);
    if (callIndex >= 0) {
      _callItems[callIndex] = newCall;
    }
    notifyListeners();
  }

  Future<void> addCall(Call call) async {
    const url = 'https://pocketdoctor-aed0a.firebaseio.com/calls.json';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'id': call.id,
          'patientName': call.patientName,
          'address': call.address,
          'sendCall': call.sendCall,
          'callAccepted': call.callAccepted,
          'callRejected': call.callRejected,
        }),
      );
      final newCall = Call(
        id: json.decode(response.body)['name'],
        patientName: call.patientName,
        address: call.address,
        sendCall: call.sendCall,
        callAccepted: call.callAccepted,
        callRejected: call.callRejected,
      );
      _callItems.add(newCall);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
